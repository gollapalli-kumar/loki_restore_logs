
module github.com/grafana/loki

go 1.22.2


//require (
//	github.com/grafana/loki/v3 v3.0.0
//	github.com/prometheus/client_golang v1.19.1
//	github.com/prometheus/common v0.54.0
//	github.com/prometheus/prometheus v0.52.1
//)



require (
//	cloud.google.com/go v0.112.0 // indirect
//	cloud.google.com/go/auth v0.2.0 // indirect
//	cloud.google.com/go/auth/oauth2adapt v0.2.0 // indirect
//	cloud.google.com/go/bigtable v1.18.1 // indirect
//	cloud.google.com/go/compute/metadata v0.3.0 // indirect
//	cloud.google.com/go/iam v1.1.6 // indirect
//	cloud.google.com/go/longrunning v0.5.5 // indirect
//	cloud.google.com/go/storage v1.36.0 // indirect
//	github.com/Azure/azure-pipeline-go v0.2.3 // indirect
//	github.com/Azure/azure-sdk-for-go/sdk/azcore v1.11.1 // indirect
//	github.com/Azure/azure-sdk-for-go/sdk/azidentity v1.5.2 // indirect
//	github.com/Azure/azure-sdk-for-go/sdk/internal v1.5.2 // indirect
//	github.com/Azure/azure-sdk-for-go/sdk/storage/azblob v0.5.1 // indirect
//	github.com/Azure/azure-storage-blob-go v0.14.0 // indirect
//	github.com/Azure/go-autorest v14.2.0+incompatible // indirect
//	github.com/Azure/go-autorest/autorest v0.11.29 // indirect
//	github.com/Azure/go-autorest/autorest/adal v0.9.23 // indirect
//	github.com/Azure/go-autorest/autorest/azure/auth v0.5.12 // indirect
//	github.com/Azure/go-autorest/autorest/azure/cli v0.4.5 // indirect
//	github.com/Azure/go-autorest/autorest/date v0.3.0 // indirect
//	github.com/Azure/go-autorest/logger v0.2.1 // indirect
//	github.com/Azure/go-autorest/tracing v0.6.0 // indirect
//	github.com/AzureAD/microsoft-authentication-library-for-go v1.2.2 // indirect
//	github.com/DataDog/sketches-go v1.4.4 // indirect
//	github.com/IBM/go-sdk-core/v5 v5.13.1 // indirect
//	github.com/IBM/ibm-cos-sdk-go v1.10.0 // indirect
//	github.com/Masterminds/goutils v1.1.1 // indirect
//	github.com/Masterminds/semver/v3 v3.2.0 // indirect
//	github.com/Masterminds/sprig/v3 v3.2.3 // indirect
//	github.com/NYTimes/gziphandler v1.1.1 // indirect
//	github.com/Workiva/go-datastructures v1.1.0 // indirect
//	github.com/alecthomas/units v0.0.0-20231202071711-9a357b53e9c9 // indirect
//	github.com/aliyun/aliyun-oss-go-sdk v2.2.7+incompatible // indirect
//	github.com/armon/go-metrics v0.4.1 // indirect
//	github.com/asaskevich/govalidator v0.0.0-20230301143203-a9d515a09cc2 // indirect
//	github.com/aws/aws-sdk-go v1.51.25 // indirect
//	github.com/aws/aws-sdk-go-v2 v1.16.0 // indirect
//	github.com/aws/aws-sdk-go-v2/config v1.15.1 // indirect
//	github.com/aws/aws-sdk-go-v2/credentials v1.11.0 // indirect
//	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.12.1 // indirect
//	github.com/aws/aws-sdk-go-v2/internal/configsources v1.1.7 // indirect
//	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.4.1 // indirect
//	github.com/aws/aws-sdk-go-v2/internal/ini v1.3.8 // indirect
//	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.9.1 // indirect
//	github.com/aws/aws-sdk-go-v2/service/sso v1.11.1 // indirect
//	github.com/aws/aws-sdk-go-v2/service/sts v1.16.1 // indirect
//	github.com/aws/smithy-go v1.11.1 // indirect
//	github.com/axiomhq/hyperloglog v0.0.0-20240124082744-24bca3a5b39b // indirect
//	github.com/baidubce/bce-sdk-go v0.9.141 // indirect
//	github.com/bboreham/go-loser v0.0.0-20230920113527-fcc2c21820a3 // indirect
//	github.com/beorn7/perks v1.0.1 // indirect
//	github.com/c2h5oh/datasize v0.0.0-20220606134207-859f65c6625b // indirect
//	github.com/census-instrumentation/opencensus-proto v0.4.1 // indirect
//	github.com/cespare/xxhash v1.1.0 // indirect
//	github.com/cespare/xxhash/v2 v2.3.0 // indirect
//	github.com/cncf/xds/go v0.0.0-20231128003011-0fa0005c9caa // indirect
//	github.com/coreos/go-semver v0.3.0 // indirect
//	github.com/coreos/go-systemd/v22 v22.5.0 // indirect
//	github.com/cristalhq/hedgedhttp v0.9.1 // indirect
//	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
//	github.com/dennwc/varint v1.0.0 // indirect
//	github.com/dgryski/go-metro v0.0.0-20180109044635-280f6062b5bc // indirect
//	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
//	github.com/dimchansky/utfbom v1.1.1 // indirect
//	github.com/dolthub/maphash v0.1.0 // indirect
//	github.com/dolthub/swiss v0.2.1 // indirect
	github.com/drone/envsubst v1.0.3 // indirect
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/edsrzf/mmap-go v1.1.0 // indirect
	github.com/efficientgo/core v1.0.0-rc.2 // indirect
	github.com/envoyproxy/go-control-plane v0.12.0 // indirect
	github.com/envoyproxy/protoc-gen-validate v1.0.4 // indirect
	github.com/facette/natsort v0.0.0-20181210072756-2cd4dd1e2dcb // indirect
	github.com/fatih/color v1.15.0 // indirect
	github.com/felixge/fgprof v0.9.3 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/fsnotify/fsnotify v1.7.0 // indirect
	github.com/fsouza/fake-gcs-server v1.7.0 // indirect
	github.com/go-kit/kit v0.12.0 // indirect
	github.com/go-kit/log v0.2.1 // indirect
	github.com/go-logfmt/logfmt v0.6.0 // indirect
	github.com/go-logr/logr v1.4.1 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-openapi/analysis v0.22.2 // indirect
	github.com/go-openapi/errors v0.22.0 // indirect
	github.com/go-openapi/jsonpointer v0.20.2 // indirect
	github.com/go-openapi/jsonreference v0.20.4 // indirect
	github.com/go-openapi/loads v0.21.5 // indirect
	github.com/go-openapi/spec v0.20.14 // indirect
	github.com/go-openapi/strfmt v0.23.0 // indirect
	github.com/go-openapi/swag v0.22.9 // indirect
	github.com/go-openapi/validate v0.23.0 // indirect
	github.com/go-playground/locales v0.14.1 // indirect
	github.com/go-playground/universal-translator v0.18.1 // indirect
	github.com/go-playground/validator/v10 v10.11.2 // indirect
	github.com/go-redis/redis/v8 v8.11.5 // indirect
	github.com/gocql/gocql v0.0.0-20200526081602-cd04bd7f22a7 // indirect
	github.com/gogo/googleapis v1.4.0 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/gogo/status v1.1.1 // indirect
	github.com/golang-jwt/jwt/v4 v4.5.0 // indirect
	github.com/golang-jwt/jwt/v5 v5.2.1 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/golang/snappy v0.0.4 // indirect
	github.com/google/btree v1.1.2 // indirect
	github.com/google/go-cmp v0.6.0 // indirect
	github.com/google/pprof v0.0.0-20240416155748-26353dc0451f // indirect
	github.com/google/s2a-go v0.1.7 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/googleapis/enterprise-certificate-proxy v0.3.2 // indirect
	github.com/googleapis/gax-go/v2 v2.12.3 // indirect
	github.com/gorilla/mux v1.8.0 // indirect
	github.com/gorilla/websocket v1.5.0 // indirect
	github.com/grafana/dskit v0.0.0-20240104111617-ea101a3b86eb // indirect
	github.com/grafana/gomemcache v0.0.0-20231204155601-7de47a8c3cb0 // indirect
	github.com/grafana/jsonparser v0.0.0-20240209175146-098958973a2d // indirect
	github.com/grafana/loki/pkg/push v0.0.0-20231124142027-e52380921608 // indirect
	github.com/grafana/pyroscope-go/godeltaprof v0.1.6 // indirect
	github.com/grafana/regexp v0.0.0-20221122212121-6b5c0a4cb7fd // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.3.0 // indirect
	github.com/grpc-ecosystem/grpc-opentracing v0.0.0-20180507213350-8e809c8a8645 // indirect
	github.com/hailocab/go-hostpool v0.0.0-20160125115350-e80d13ce29ed // indirect
	github.com/hashicorp/consul/api v1.28.2 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-hclog v1.5.0 // indirect
	github.com/hashicorp/go-immutable-radix v1.3.1 // indirect
	github.com/hashicorp/go-msgpack v0.5.5 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/hashicorp/go-retryablehttp v0.7.4 // indirect
	github.com/hashicorp/go-rootcerts v1.0.2 // indirect
	github.com/hashicorp/go-sockaddr v1.0.6 // indirect
	github.com/hashicorp/go-version v1.6.0 // indirect
	github.com/hashicorp/golang-lru v0.6.0 // indirect
	github.com/hashicorp/golang-lru/v2 v2.0.7 // indirect
	github.com/hashicorp/memberlist v0.5.0 // indirect
	github.com/hashicorp/serf v0.10.1 // indirect
	github.com/huandu/xstrings v1.3.3 // indirect
	github.com/imdario/mergo v0.3.16 // indirect
	github.com/influxdata/tdigest v0.0.2-0.20210216194612-fc98d27c9e8b // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/jpillora/backoff v1.0.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/julienschmidt/httprouter v1.3.0 // indirect
	github.com/klauspost/compress v1.17.8 // indirect
	github.com/klauspost/cpuid/v2 v2.2.5 // indirect
	github.com/klauspost/pgzip v1.2.5 // indirect
	github.com/kylelemons/godebug v1.1.0 // indirect
	github.com/leodido/go-urn v1.2.1 // indirect
	github.com/mailru/easyjson v0.7.7 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-ieproxy v0.0.1 // indirect
	github.com/mattn/go-isatty v0.0.19 // indirect
	github.com/miekg/dns v1.1.59 // indirect
	github.com/minio/md5-simd v1.1.2 // indirect
	github.com/minio/minio-go/v7 v7.0.61 // indirect
	github.com/minio/sha256-simd v1.0.1 // indirect
	github.com/mitchellh/copystructure v1.0.0 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/mitchellh/reflectwalk v1.0.1 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f // indirect
	github.com/ncw/swift v1.0.53 // indirect
	github.com/oklog/run v1.1.0 // indirect
	github.com/oklog/ulid v1.3.1 // indirect
	github.com/opentracing-contrib/go-grpc v0.0.0-20210225150812-73cb765af46e // indirect
	github.com/opentracing-contrib/go-stdlib v1.0.0 // indirect
	github.com/opentracing/opentracing-go v1.2.0 // indirect
	github.com/pierrec/lz4/v4 v4.1.18 // indirect
	github.com/pkg/browser v0.0.0-20240102092130-5ac0b6a4141c // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/prometheus/alertmanager v0.27.0 // indirect
	github.com/prometheus/client_model v0.6.1 // indirect
	github.com/prometheus/common/sigv4 v0.1.0 // indirect
	github.com/prometheus/exporter-toolkit v0.11.0 // indirect
	github.com/prometheus/procfs v0.12.0 // indirect
	github.com/richardartoul/molecule v1.0.0 // indirect
	github.com/rs/xid v1.5.0 // indirect
	github.com/sean-/seed v0.0.0-20170313163322-e2103e2c3529 // indirect
	github.com/sercand/kuberesolver/v5 v5.1.1 // indirect
	github.com/shopspring/decimal v1.2.0 // indirect
	github.com/sirupsen/logrus v1.9.3 // indirect
	github.com/soheilhy/cmux v0.1.5 // indirect
	github.com/sony/gobreaker v0.5.0 // indirect
	github.com/spaolacci/murmur3 v1.1.0 // indirect
	github.com/spf13/afero v1.10.0 // indirect
	github.com/spf13/cast v1.3.1 // indirect
	github.com/stretchr/objx v0.5.2 // indirect
	github.com/stretchr/testify v1.9.0 // indirect
	github.com/thanos-io/objstore v0.0.0-20230829152104-1b257a36f9a3 // indirect
	github.com/uber/jaeger-client-go v2.30.0+incompatible // indirect
	github.com/uber/jaeger-lib v2.4.1+incompatible // indirect
	github.com/willf/bitset v1.1.11 // indirect
	github.com/willf/bloom v2.0.3+incompatible // indirect
//	go.etcd.io/bbolt v1.3.6 // indirect
//	go.etcd.io/etcd/api/v3 v3.5.4 // indirect
//	go.etcd.io/etcd/client/pkg/v3 v3.5.4 // indirect
//	go.etcd.io/etcd/client/v3 v3.5.4 // indirect
//	go.mongodb.org/mongo-driver v1.14.0 // indirect
//	go.opencensus.io v0.24.0 // indirect
//	go.opentelemetry.io/collector/featuregate v1.5.0 // indirect
//	go.opentelemetry.io/collector/pdata v1.5.0 // indirect
//	go.opentelemetry.io/collector/semconv v0.98.0 // indirect
//	go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.49.0 // indirect
//	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.50.0 // indirect
//	go.opentelemetry.io/otel v1.25.0 // indirect
//	go.opentelemetry.io/otel/metric v1.25.0 // indirect
//	go.opentelemetry.io/otel/trace v1.25.0 // indirect
//	go.uber.org/atomic v1.11.0 // indirect
//	go.uber.org/goleak v1.3.0 // indirect
//	go.uber.org/multierr v1.11.0 // indirect
//	go.uber.org/zap v1.21.0 // indirect
//	go4.org/netipx v0.0.0-20230125063823-8449b0a6169f // indirect
//	golang.org/x/crypto v0.22.0 // indirect
//	golang.org/x/exp v0.0.0-20240325151524-a685a6edb6d8 // indirect
//	golang.org/x/mod v0.17.0 // indirect
//	golang.org/x/net v0.24.0 // indirect
//	golang.org/x/oauth2 v0.19.0 // indirect
//	golang.org/x/sync v0.7.0 // indirect
//	golang.org/x/sys v0.19.0 // indirect
//	golang.org/x/text v0.14.0 // indirect
//	golang.org/x/time v0.5.0 // indirect
//	golang.org/x/tools v0.20.0 // indirect
//	gonum.org/v1/gonum v0.8.2 // indirect
//	google.golang.org/api v0.174.0 // indirect
//	google.golang.org/genproto v0.0.0-20240227224415-6ceb2ff114de // indirect
//	google.golang.org/genproto/googleapis/api v0.0.0-20240415180920-8c6c420018be // indirect
//	google.golang.org/genproto/googleapis/rpc v0.0.0-20240415180920-8c6c420018be // indirect
//	google.golang.org/grpc v1.63.2 // indirect
//	google.golang.org/protobuf v1.34.0 // indirect
//	gopkg.in/inf.v0 v0.9.1 // indirect
//	gopkg.in/ini.v1 v1.67.0 // indirect
//	gopkg.in/yaml.v2 v2.4.0 // indirect
//	gopkg.in/yaml.v3 v3.0.1 // indirect
//	k8s.io/apimachinery v0.29.3 // indirect
//	k8s.io/client-go v0.29.3 // indirect
//	k8s.io/klog/v2 v2.120.1 // indirect
//	k8s.io/utils v0.0.0-20230726121419-3b25d923346b // indirect
//	rsc.io/binaryregexp v0.2.0 // indirect
)


// replace github.com/gocql/gocql => github.com/grafana/gocql v0.0.0-20200605141915-ba5dc39ece85

// replace github.com/prometheus/prometheus => github.com/prometheus/prometheus v0.51.0
