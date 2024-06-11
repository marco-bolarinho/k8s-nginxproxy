kubectl delete deployment/nginx-proxy
kubectl delete service/nginx-service

kubectl create configmap nginx-config --from-file=nginx.conf
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml


