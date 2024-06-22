kubectl delete deployment/postgres
kubectl delete service/postgres-service
#kubectl delete pvc/postgres-pvc

kubectl apply -f secrets.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
