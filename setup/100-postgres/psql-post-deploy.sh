#!/bin/bash


kubectl exec -it service/postgres-service -- psql postgresql://admin:Passw0rd@localhost:5432/main <<- EOSQL

  CREATE USER plik;
  CREATE DATABASE plik_db;
  GRANT ALL PRIVILEGES ON DATABASE plik_db TO plik;


EOSQL
