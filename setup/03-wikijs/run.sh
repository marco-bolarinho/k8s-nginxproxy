kubectl delete deployment.apps/wikijs
kubectl delete service/wikijs-service

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml