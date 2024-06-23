kubectl delete configmap/plik-cfg
kubectl delete deployment/plik
kubectl delete service/plik-service

kubectl apply -f pvc.yaml
#kubectl create configmap plik-cfg --from-file=plikd.cfg
./config.sh
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml