kubectl delete deployment/ots
kubectl delete service/ots-service

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml