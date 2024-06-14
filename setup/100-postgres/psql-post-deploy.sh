#!/bin/bash


kubectl exec -it service/postgres-service -- psql postgresql://admin:Passw0rd@localhost:5432/main <<- EOSQL

  CREATE USER plik;
  CREATE DATABASE plik_db;
  GRANT ALL PRIVILEGES ON DATABASE my_project_development TO plik;


EOSQL
