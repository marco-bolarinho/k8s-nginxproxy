## EJBCA

EJBCA is a PKI Certificate Authority software, which allows you to set up your own CA. The following command runs EJBCA in a Docker container:

```
docker run -it --rm -p 801:8080 -p 443:8443 -h mycahostname keyfactor/ejbca-ce:8.0.0
```

For more information, visit the [EJBCA Docker Hub page](https://hub.docker.com/r/keyfactor/ejbca-ce).

## PLIK

PLIK is a scalable and friendly temporary file upload system. The following command runs PLIK in a Docker container:

```
docker run -p 5000:8080 rootgg/plik:latest
```

For more information, visit the [PLIK Docker Hub page](https://hub.docker.com/r/rootgg/plik).

## Wiki.js

Wiki.js is a powerful and extensible open-source Wiki software. The following command runs Wiki.js in a Docker container with specified environment variables and volume mappings:

```
docker run -d \
  --name=wikijs \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 3000:3000 \
  -v /path/to/wikijs/config:/config \
  -v /path/to/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/wikijs:latest
```

Replace `/path/to/wikijs/config` and `/path/to/data` with actual paths on your host machine.

For more information, visit the [Wiki.js Docker Hub page](https://hub.docker.com/r/linuxserver/wikijs).

## Onetime Secret

Onetime Secret is a simple way to share sensitive information, such as passwords, with others. The following command runs Onetime Secret in a Docker container:

```
docker run --name ots -p "7143:7143" dismantl/onetimesecret
```

For more information, visit the [Onetime Secret Docker Hub page](https://hub.docker.com/r/dismantl/onetimesecret).

## Nginx

Nginx is a high-performance HTTP server and reverse proxy. The following commands run Nginx in a Docker container with different configurations:

Basic HTML serving:

```
docker run -d -p 80:80 -v ./html:/usr/share/nginx/html:ro nginx
```

Custom Nginx configuration:

```
docker run -d -p 80:80 -v ./nginx.conf:/etc/nginx/nginx.conf -v ./html:/usr/share/nginx/html:ro nginx
```

Note: Permissions for mounted volumes may need to be adjusted with `chmod 777`.

## DNS

Technitium DNS Server is an open-source, privacy-focused DNS server. The following Docker Compose file runs the DNS server with specified ports and environment variables:

```yaml
version: "3"
services:
  dns-server:
    container_name: dns-server
    hostname: dns-server
    image: technitium/dns-server:latest
    ports:
      - "5380:5380/tcp" # DNS web console (HTTP)
      # - "53443:53443/tcp" # DNS web console (HTTPS)
      - "172.31.33.0:53:53/udp" # DNS service
      - "172.31.33.0:53:53/tcp" # DNS service
      # - "853:853/udp" # DNS-over-QUIC service
      # - "853:853/tcp" # DNS-over-TLS service
      # - "443:443/udp" # DNS-over-HTTPS service (HTTP/3)
      # - "443:443/tcp" # DNS-over-HTTPS service (HTTP/1.1, HTTP/2)
      # - "80:80/tcp" # DNS-over-HTTP service (use with reverse proxy or certbot certificate renewal)
      # - "8053:8053/tcp" # DNS-over-HTTP service (use with reverse proxy)
      # - "67:67/udp" # DHCP service      
    environment:
      - DNS_SERVER_DOMAIN=dns-server # The primary domain name used by this DNS Server to identify itself.
      # - DNS_SERVER_ADMIN_PASSWORD=password # DNS web console admin user password.
      # - DNS_SERVER_ADMIN_PASSWORD_FILE=password.txt # The path to a file that contains a plain text password for the DNS web console admin user.
      # - DNS_SERVER_PREFER_IPV6=false # DNS Server will use IPv6 for querying whenever possible with this option enabled.
      # - DNS_SERVER_WEB_SERVICE_HTTP_PORT=5380 # The TCP port number for the DNS web console over HTTP protocol.
      # - DNS_SERVER_WEB_SERVICE_HTTPS_PORT=53443 # The TCP port number for the DNS web console over HTTPS protocol.
      # - DNS_SERVER_WEB_SERVICE_ENABLE_HTTPS=false # Enables HTTPS for the DNS web console.
      # - DNS_SERVER_WEB_SERVICE_USE_SELF_SIGNED_CERT=false # Enables self-signed TLS certificate for the DNS web console.
      # - DNS_SERVER_OPTIONAL_PROTOCOL_DNS_OVER_HTTP=false # Enables DNS server optional protocol DNS-over-HTTP on TCP port 8053 to be used with a TLS terminating reverse proxy like nginx.
      # - DNS_SERVER_RECURSION=AllowOnlyForPrivateNetworks # Recursion options: Allow, Deny, AllowOnlyForPrivateNetworks, UseSpecifiedNetworks.
      # - DNS_SERVER_RECURSION_DENIED_NETWORKS=1.1.1.0/24 # Comma-separated list of IP addresses or network addresses to deny recursion. Valid only for `UseSpecifiedNetworks` recursion option.
      # - DNS_SERVER_RECURSION_ALLOWED_NETWORKS=127.0.0.1, 192.168.1.0/24 # Comma-separated list of IP addresses or network addresses to allow recursion. Valid only for `UseSpecifiedNetworks` recursion option.
      # - DNS_SERVER_ENABLE_BLOCKING=false # Sets the DNS server to block domain names using Blocked Zone and Block List Zone.
      # - DNS_SERVER_ALLOW_TXT_BLOCKING_REPORT=false # Specifies if the DNS Server should respond with TXT records containing a blocked domain report for TXT type requests.
      # - DNS_SERVER_BLOCK_LIST_URLS= # A comma-separated list of block list URLs.
      - DNS_SERVER_FORWARDERS=1.1.1.1, 8.8.8.8 # Comma-separated list of forwarder addresses.
      # - DNS_SERVER_FORWARDER_PROTOCOL=Tcp # Forwarder protocol options: Udp, Tcp, Tls, Https, HttpsJson.
      # - DNS_SERVER_LOG_USING_LOCAL_TIME=true # Enable this option to use local time instead of UTC for logging.
    volumes:
      - config:/etc/dns
    restart: unless-stopped
    sysctls:
      - net.ipv4.ip_local_port_range=1024 65000
volumes:
    config:
```

For more information, visit the [Technitium DNS Server Docker Hub page](https://hub.docker.com/r/technitium/dns-server).

Run `docker compose up` to start the DNS server.
