#!/bin/bash


kubectl exec -it service/postgres-service -- psql postgresql://admin:Passw0rd@localhost:5432/main <<- EOSQL

  \conninfo;


EOSQL
