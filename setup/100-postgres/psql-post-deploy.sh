#!/bin/bash


kubectl exec -it service/postgres-service -- psql postgresql://admin:Passw0rd@localhost:5432/main <<- EOSQL

  CREATE USER plik;
  ALTER USER plik WITH PASSWORD 'Passw0rd';
  CREATE DATABASE plik_db;
  GRANT ALL PRIVILEGES ON DATABASE plik_db TO plik;

  CREATE USER ots;
  ALTER USER ots WITH PASSWORD 'Passw0rd';
  CREATE DATABASE ots_db;
  GRANT ALL PRIVILEGES ON DATABASE ots_db TO ots;

  CREATE USER ejbca;
  ALTER USER ejbca WITH PASSWORD 'Passw0rd';
  CREATE DATABASE ejbca_db;
  GRANT ALL PRIVILEGES ON DATABASE ejbca_db TO ejbca;

  CREATE USER wiki;
  ALTER USER wiki WITH PASSWORD 'Passw0rd';
  CREATE DATABASE wiki_db;
  GRANT ALL PRIVILEGES ON DATABASE wiki_db TO wiki;

EOSQL
