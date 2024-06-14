#!/bin/bash


kubectl exec -it service/postgres-service -- psql postgresql://admin:Passw0rd@localhost:5432/main <<- EOSQL

  CREATE USER plik;
  ALTER USER plik WITH PASSWORD 'Passw0rd';
  CREATE DATABASE plik_db;
  GRANT ALL PRIVILEGES ON DATABASE plik_db TO plik;


EOSQL
