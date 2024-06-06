## EJBCA

```
docker run -it --rm -p 801:8080 -p 443:8443 -h mycahostname keyfactor/ejbca-ce:8.0.0
```
https://hub.docker.com/r/keyfactor/ejbca-ce

## PLIK

```
docker run -p 5000:8080 rootgg/plik:latest
```
* https://hub.docker.com/r/rootgg/plik

## Wiki.js

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
* https://hub.docker.com/r/linuxserver/wikijs

## Onetime secret

```
docker run --name ots -p "7143:7143" dismantl/onetimesecret
```
* https://hub.docker.com/r/dismantl/onetimesecret

## Nginx

Permissions are weird, `chmod 777` and pray.

```
docker run -d -p 80:80 -v ./html:/usr/share/nginx/html:ro nginx
```

```
docker run -d -p 80:80 -v ./nginx.conf:/etc/nginx/nginx.conf -v ./html:/usr/share/nginx/html:ro nginx
```



