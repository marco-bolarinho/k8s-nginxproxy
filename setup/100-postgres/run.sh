#!/bin/bash

kubectl delete configmap/psql-secret
kubectl delete deployment/postgre
kubectl delete service/postgre-service

kubectl apply -f configmap-secret
kubectl apply -f psql-pv.yaml
kubectl apply -f psql-pcv.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml