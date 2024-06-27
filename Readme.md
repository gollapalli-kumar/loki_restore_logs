
Activate virtual environment

python3 -m venv .venv
. .venv/bin/activate

pip3 install flask boto3

Configure AWS Credentials

Use session Token for temporary 

aws sts get-session-token --serial-number "arn-mfa" --token-code 000000 (Change MFA Token)

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=

After Expiry of Session token 

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

python3 app.py

