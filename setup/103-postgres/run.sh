kubectl delete deployment/postgres
kubectl delete service/postgres

kubectl apply -f secrets.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
