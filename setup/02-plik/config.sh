#!/bin/bash

plik_user=$(k get secret/cluster-secrets -o jsonpath='{.data.plik_usr}' | base64 -d)
plik_pass=$(k get secret/cluster-secrets -o jsonpath='{.data.plik_pass}' | base64 -d)
plik_database=$(k get secret/cluster-secrets -o jsonpath='{.data.plik_db}' | base64 -d)

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: plik-cfg
data:
    plikd.cfg: |
        #####
        ##
        #  Plik - Configuration File
        #

        Debug               = false            # Enable debug mode
        DebugRequests       = false            # Log HTTP request and responses
        LogLevel            = "INFO"           # Log level (DEBUG|INFO|WARNING|CRITICAL)

        ListenPort          = 8080             # Port the HTTP server will listen on
        ListenAddress       = "0.0.0.0"        # Address the HTTP server will bind on
        MetricsPort         = 0                # Port the HTTP metrics server will listen on (0 = disabled)
        MetricsAddress      = "0.0.0.0"        # Address the HTTP server will bind on
        Path                = ""               # HTTP root path
        SslEnabled          = false            # Enable SSL
        SslCert             = "plik.crt"       # Path to your certificate file
        SslKey              = "plik.key"       # Path to your certificate private key file
        TlsVersion          = "tlsv10"         # TLS version (tlsv10|tlsv11|tlsv12|tlsv13)
        NoWebInterface      = false            # Disable web user interface
        DownloadDomain      = ""               # Enforce download domain ( ex : https://dl.plik.root.gg ) ( necessary for quick upload to work )
        DownloadDomainAlias = []               # Set download domain aliases ( ex : ["http://localhost:8080","http://127.0.0.1:8080"] ) ( must config a DownloadDomain first )
        EnhancedWebSecurity = false            # Enable additional security headers ( X-Content-Type-Options, X-XSS-Protection, X-Frame-Options, Content-Security-Policy, Secure Cookies, ... )
        SessionTimeout      = "365d"           # Web UI authentication session timeout (https://chromestatus.com/feature/4887741241229312)
        AbuseContact        = ""               # Abuse contact to be displayed in the footer of the webapp ( email address )
        WebappDirectory     = "../webapp/dist" # Root directory for webapp static content
        ClientsDirectory    = "../clients"     # Root directory for client binaries
        ChangelogDirectory  = "../changelog"   # Root directory for changelog (to be displayed when updating clients)
        SourceIpHeader      = ""               # If behind reverse proxy ( ex : X-FORWARDED-FOR )
        UploadWhitelist     = []               # Restrict upload and user creation to one or more IP range ( CIDR notation, /32 can be omitted )

        MaxFileSizeStr      = "10GB"           # 10GB (or "unlimited")
        MaxUserSizeStr      = "unlimited"      # Default max uploaded size per user unless configured otherwise (or "unlimited")
        MaxFilePerUpload    = 1000

        DefaultTTLStr       = "30d"            # 30 days
        MaxTTLStr           = "30d"            # 0 : No limit

        # Feature flags to enable/disable Plik features.
        #  - disabled : feature is always off
        #  - enabled  : feature is opt-in
        #  - default  : feature is opt-out
        #  - forced   : feature is always on
        FeatureAuthentication = "disabled"     # disabled -> no authentication / forced -> no anonymous upload / default -> enabled
        FeatureOneShot        = "enabled"      # Upload with files that are automatically deleted after the first download
        FeatureRemovable      = "enabled"      # Upload with files that anybody can delete
        FeatureStream         = "enabled"      # Upload with files that are not stored on the server
        FeaturePassword       = "enabled"      # Upload that are protected by HTTP basic auth login/password
        FeatureComments       = "enabled"      # Upload with markdown comments / forced -> default
        FeatureSetTTL         = "enabled"      # When disabled upload TTL is always set to DefaultTTL
        FeatureExtendTTL      = "disabled"     # Extend upload expiration date by TTL each time it is accessed
        FeatureClients        = "enabled"      # Display the clients download button in the web UI
        FeatureGithub         = "enabled"      # Display the source code link in the web UI
        FeatureText           = "enabled"      # Upload text dialog

        GoogleApiClientID   = ""               # Google api client ID
        GoogleApiSecret     = ""               # Google api client secret
        GoogleValidDomains  = []               # List of acceptable email domains for users
        OvhApiKey           = ""               # OVH api application key
        OvhApiSecret	    = ""               # OVH api application secret
        OvhApiEndpoint      = ""               # OVH api endpoint to use. Defaults to https://eu.api.ovh.com/1.0

        #   Data backend configuration
        #
        #   Example using File :
        #
        #   DataBackend = "file"
        #   [DataBackendConfig]
        #       Directory = "files"
        #
        #   Example using Google Cloud Storage :
        #
        #   DataBackend = "gcs"
        #   [DataBackendConfig]
        #       Bucket = "MyAwesomeBucket"
        #       Folder = "plik"
        #
        #   Example using OpenStack Swift :
        #
        #   DataBackend = "swift"
        #   [DataBackendConfig]
        #       Container = "plik"
        #       AuthUrl = "https://auth.swiftauthapi.xxx/v2.0/"
        #       UserName = "user@tld.net"
        #       ApiKey = "xxxxxxxxxxxxxxxx"
        #       Domain = "domain"  // Name of the domain (v3 auth only)
        #       Tenant = "tenant"  // Name of the tenant (v2 auth only)
        #
        #       Please refer to https://github.com/ncw/swift for all
        #       connection settings available (v1/v2/v3)
        #
        #
        #   DataBackend  = "s3"
        #   [DataBackendConfig]
        #       Endpoint = "127.0.0.1:9000"
        #       AccessKeyID = "access_key_id"
        #       SecretAccessKey = "access_key_secret"
        #       Bucket = "plik"
        #       Location = "us-east-1"
        #       Prefix = ""
        #       UseSSL = true
        #       PartSize = 16777216 // Chunk size when file size is not known. (default 16MiB, min 5MiB)
        #                           // Multiply by 10000 to get the max upload file size (max upload file size 156GiB)
        #       SSE = ""  // the following encryption methods are available :
        #                 //  - SSE-C: S3 server-side-encryption with keys managed by Plik
        #                 //  - S3:    S3 server-side-encryption with keys managed by the S3 backend

        DataBackend = "file"
        [DataBackendConfig]
            Directory = "files"

        #   Metadata backend configuration
        #
        #   Supported drivers : sqlite3 / postgres / mysql
        #   Connection string : See http://gorm.io/docs/connecting_to_the_database.html
        #
        [MetadataBackendConfig]
            Driver = "postgres" #sqlite3
            ConnectionString = "host=postgres-service user=$plik_user password=$plik_pass dbname=$plik_database port=5432 sslmode=disable" #plik.db
            Debug = false # Log SQL requests
EOF