## Nginx

Example of a server block to be added to `/etc/nginx/nginx.conf`.

```
server {
        listen      80;
        server_name wiki.st0cki.camdvr.org;

        location / {
                proxy_pass http://localhost:3000;
        }
}
```


