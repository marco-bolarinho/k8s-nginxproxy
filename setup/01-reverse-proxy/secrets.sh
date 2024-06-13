kubectl delete secret/cert
kubectl delete secret/cert-key

kubectl create secret generic cert --from-file=cert.pem
kubectl create secret generic cert-key --from-file=cert-key.pem