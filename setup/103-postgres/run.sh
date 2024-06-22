kubectl delete deployment/postgres
kubectl delete service/postgres-service
kubectl delete pvc/postgres-pvc
#kubectl delete configmap/postgres-initdb

#kubectl apply -f init-configmap.yaml
kubectl apply -f pvc.yaml
kubectl apply -f secrets.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
