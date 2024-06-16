kubectl delete configmap/nginx-config
kubectl delete configmap/index
kubectl delete deployment/nginx-proxy
kubectl delete service/nginx-service

kubectl create configmap nginx-config --from-file=nginx.conf
kubectl create configmap index --from-file=index.html
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml


