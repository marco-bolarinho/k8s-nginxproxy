kubectl delete configmap/nginx-config

kubectl create configmap nginx-config --from-file=nginx.conf
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml


