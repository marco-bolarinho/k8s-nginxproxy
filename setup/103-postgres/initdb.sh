#!/bin/bash

read -p "This script uses information stored in the cluster-secrets, make sure to deploy it first. Press enter to continue"

plik_user=$(k get secret/cluster-secrets -o jsonpath='{.data.plik_usr}' | base64 -d)
plik_pass=$(k get secret/cluster-secrets -o jsonpath='{.data.plik_pass}' | base64 -d)
plik_database=$(k get secret/cluster-secrets -o jsonpath='{.data.plik_db}' | base64 -d)

wiki_user=$(k get secret/cluster-secrets -o jsonpath='{.data.wiki_usr}' | base64 -d)
wiki_pass=$(k get secret/cluster-secrets -o jsonpath='{.data.wiki_pass}' | base64 -d)
wiki_database=$(k get secret/cluster-secrets -o jsonpath='{.data.wiki_db}' | base64 -d)

ejbca_user=$(k get secret/cluster-secrets -o jsonpath='{.data.ejbca_usr}' | base64 -d)
ejbca_pass=$(k get secret/cluster-secrets -o jsonpath='{.data.ejbca_pass}' | base64 -d)
ejbca_database=$(k get secret/cluster-secrets -o jsonpath='{.data.ejbca_db}' | base64 -d)

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: postgres-initdb
data:
  01-init.sql: |
    CREATE DATABASE $plik_database;
    CREATE USER $plik_user WITH ENCRYPTED PASSWORD '$plik_pass';
    GRANT ALL PRIVILEGES ON DATABASE $plik_database TO $plik_user;
    \c $plik_database postgres
    GRANT ALL ON SCHEMA public TO $plik_user;

    CREATE DATABASE $wiki_database;
    CREATE USER $wiki_user WITH ENCRYPTED PASSWORD '$wiki_pass';
    GRANT ALL PRIVILEGES ON DATABASE $wiki_database TO $wiki_user;
    \c $wiki_database postgres
    GRANT ALL ON SCHEMA public TO $wiki_user;

    CREATE DATABASE $ejbca_database;
    CREATE USER $ejbca_user WITH ENCRYPTED PASSWORD '$ejbca_pass';
    GRANT ALL PRIVILEGES ON DATABASE $ejbca_database TO $ejbca_user;
    \c $ejbca_database postgres
    GRANT ALL ON SCHEMA public TO $ejbca_user;
EOF