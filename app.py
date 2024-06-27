import re
import subprocess
import os
from datetime import datetime, timedelta, timezone
import boto3
import glob
from flask import Flask, request, render_template, redirect, url_for

app = Flask(__name__)

# AWS setup and other helper functions
def get_temporary_session():
    return boto3.Session(
        aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),
        aws_session_token=os.getenv('AWS_SESSION_TOKEN')
    )

session = get_temporary_session()
s3 = session.client('s3')

def run_go_file(bucket, directory, go_file):
    env = os.environ.copy()
    env["BUCKET"] = bucket
    env["DIR"] = directory
    env["GOPATH"] = os.path.expanduser("~/go")
    env["PATH"] = env["PATH"] + os.pathsep + os.path.join(env["GOPATH"], "bin")

    try:
        result = subprocess.run(['go', 'run', go_file], capture_output=True, text=True, env=env)
        if result.returncode != 0:
            return f"Error running {go_file}: {result.stderr}"
        return result.stdout
    except Exception as e:
        return f"Exception while running Go file: {str(e)}"

def find_ids_by_app_name(output, app_name):
    pattern = re.compile(r'\{\{.*?app="' + re.escape(app_name) + r'".*?\}\s+(\w+)\}')
    matches = pattern.findall(output)
    return matches if matches else None

def convert_to_hex(milliseconds):
    return hex(int(milliseconds))[2:]

def search_entries_by_id(output, app_id):
    pattern = re.compile(r'\{fake ' + re.escape(app_id) + r' (\d+\.\d+) (\d+\.\d+) (\d+)\}')
    matches = pattern.findall(output)

    results = []
    for match in matches:
        start_time_ms = float(match[0]) * 1000
        end_time_ms = float(match[1]) * 1000
        start_hex = convert_to_hex(start_time_ms)
        end_hex = convert_to_hex(end_time_ms)
        checksum_hex = hex(int(match[2]))[2:]  # Remove '0x'
        results.append((match[0], match[1], f"{start_hex}:{end_hex}:{checksum_hex}"))

    return results

def convert_utc_to_ist(utc_time):
    ist = timezone(timedelta(hours=5, minutes=30))
    ist_time = utc_time.astimezone(ist)
    return ist_time

def is_within_time_range(start_time, start_range, end_range):
    return start_range <= start_time.time() <= end_range

def download_first_file_from_s3(bucket_name, folder_prefix, subfolder_index, fake_folder, download_dir):
    folder_path = f"{folder_prefix}/{subfolder_index}/{fake_folder}/"
    try:
        response = s3.list_objects_v2(Bucket=bucket_name, Prefix=folder_path)
        if 'Contents' in response:
            first_file = response['Contents'][0]['Key']
            file_name = os.path.basename(first_file)
            download_path = os.path.join(download_dir, file_name)
            existing_files = glob.glob(os.path.join(download_dir, '*'))
            for file in existing_files:
                os.remove(file)
            s3.download_file(bucket_name, first_file, download_path)
            return f"<h3>File {file_name} downloaded successfully from S3.</h3>"
        else:
            return "No files found in the specified folder."
    except Exception as e:
        return f"Error downloading file: {e}"

def calculate_indexno(input_date):
    epoch = datetime(1970, 1, 1)
    input_date = datetime.strptime(input_date, "%d/%m/%Y")
    delta = input_date - epoch
    return delta.days

def check_restore_status(bucket_name, object_key):
    try:
        response = s3.head_object(Bucket=bucket_name, Key=object_key)
        restore_status = response.get('Restore', '')
        return restore_status
    except Exception as e:
        return f"Error checking restore status for {object_key}: {e}"
        

def initiate_restore(bucket_name, object_key, days, tier='Bulk'):
    restore_status = check_restore_status(bucket_name, object_key)
    
    if restore_status:
        if 'ongoing-request="true"' in restore_status:
            return f"Restore is <b><i>already in progress</i></b> for {object_key}."
        elif 'ongoing-request="false"' in restore_status:
            expiry_index = restore_status.find('expiry-date="') + len('expiry-date="')
            expiry_date = restore_status[expiry_index:restore_status.find('"', expiry_index)]
            return f"{object_key} is already <b><i>restored and will expire</i></b> at {expiry_date}."
    else:
        try:
            s3.restore_object(
                Bucket=bucket_name,
                Key=object_key,
                RestoreRequest={
                    'Days': days,
                    'GlacierJobParameters': {
                        'Tier': tier
                    }
                }
            )
            return f"Restore request initiated for {object_key}. It is a {tier} restore, which takes 5 to 12 hours."
        except Exception as e:
            return f"Error initiating restore for {object_key}: {e}"

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        input_date = request.form['input_date']
        app_name = request.form['app_name']
        try:
            days = int(request.form['days'])
        except ValueError:
            return "Invalid input. Please enter a valid number for days."

        use_time_range = request.form.get('use_time_range')
        if use_time_range == 'yes':
            start_range_str = request.form['start_range'].replace(" ", "").lower()
            try:
                start_range = datetime.strptime(start_range_str, "%I:%M%p").time()
            except ValueError:
                return "Invalid input format. Please use '11:00AM' or '11:00am' format for start time."

            end_range_str = request.form['end_range'].replace(" ", "").lower()
            try:
                end_range = datetime.strptime(end_range_str, "%I:%M%p").time()
            except ValueError:
                return "Invalid input format. Please use '3:00PM' or '3:00pm' format for end time."
        else:
            start_range = datetime.strptime("12:00am", "%I:%M%p").time()
            end_range = datetime.strptime("11:59:59pm", "%I:%M:%S%p").time()

        bucket_choice = request.form['bucket_choice']
        buckets = {
            '1': "cc-stack-cctesting-infra-testing-one-lokistore",
            '2': "crm-crm-nightly-new-lokidatastore",
            '3': "crm-crm-staging-new-lokidatastore"
        }
        bucket_name = buckets.get(bucket_choice)
        if not bucket_name:
            return "Invalid bucket choice."

        folder_prefix = 'index'
        fake_folder = 'fake'
        download_dir = '/tmp/loki_clone/chunks/index/index_20000/fake'
        indexno = calculate_indexno(input_date)
        subfolder_index = f'index_{indexno}'
        os.makedirs(download_dir, exist_ok=True)

        download_status = download_first_file_from_s3(bucket_name, folder_prefix, subfolder_index, fake_folder, download_dir)
        directory = '/tmp/loki-index-analysis'
        go_file = 'loki_decrypting_S3_logs.go'
        output = run_go_file('20000', directory, go_file)
        if not output:
            return "Failed to run Go file."

        app_ids = find_ids_by_app_name(output, app_name)
        if not app_ids:
            return f"'{app_name}' not found in the output."

        results = []
        total_count = 0
        ist = timezone(timedelta(hours=5, minutes=30))
        for app_id in app_ids:
            search_results = search_entries_by_id(output, app_id)
            filtered_results = []
            for result in search_results:
                start_time = datetime.fromtimestamp(float(result[0]), tz=ist)
                if is_within_time_range(start_time, start_range, end_range):
                    filtered_results.append(result[2])
            total_count += len(filtered_results)
            results.append((app_id, filtered_results))

        return render_template('result.html', results=results, download_status=download_status, total_count=total_count, days=days, bucket_name=bucket_name)

    return render_template('index.html')

@app.route('/restore', methods=['POST'])
def restore():
    app_ids = request.form.getlist('app_id')
    restore_keys = request.form.getlist('restore_key')
    bucket_name = request.form['bucket_name']
    days = int(request.form['days'])

    restore_messages = []
    for app_id, restore_key in zip(app_ids, restore_keys):
        folder_path = f"fake/{app_id}/{restore_key}"
        restore_message = initiate_restore(bucket_name, folder_path, days)
        restore_messages.append(restore_message)

    return render_template('restore.html', restore_messages=restore_messages)

if __name__ == '__main__':
    app.run(debug=True)
