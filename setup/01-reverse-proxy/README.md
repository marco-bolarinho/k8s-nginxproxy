## Before running

1. HTTPS
   - Add your certificates to this folder and name them `cert.pem` and `cert-key.pem` or change the `--from-file` in secrets.sh
   - Run the `secrets.sh` script.
2. Edit `nginx.config`
   - Change `marco-k8s.cloudns.be` domain name entries to your domain name equivalent.
3. Run the `run.sh` script
