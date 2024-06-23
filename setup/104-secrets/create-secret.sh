#!/bin/bash

echo ===Plik===
echo User: $(echo $PLIK_USR | base64 -d)
echo Password: $(echo $PLIK_PWD | base64 -d)
echo Database name: $(echo $PLIK_DB | base64 -d)
echo ===Wiki===
echo User: $(echo $WIKI_USR | base64 -d)
echo Password: $(echo $WIKI_PWD | base64 -d)
echo Database name: $(echo $WIKI_DB | base64 -d)
echo ===EJBCA===
echo User: $(echo $EJBCA_USR | base64 -d)
echo Password: $(echo $EJBCA_PWD | base64 -d)
echo Database name: $(echo $EJBCA_DB | base64 -d)
echo ===Default Password===
echo Password: $(echo $DEFAULT_PWD | base64 -d)

read -p "Is this information correct? Press enter to continue"

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: cluster-secrets
type: Opaque
data:
  # Plik database
  plik_db: $PLIK_DB
  plik_usr: $PLIK_USR
  plik_pass: $PLIK_PWD
  # Wiki database 
  wiki_db: $WIKI_DB
  wiki_usr: $WIKI_USR
  wiki_pass: $WIKI_PWD
  # Ejbca database
  ejbca_db: $EJBCA_DB
  ejbca_usr: $EJBCA_USR
  ejbca_pass: $EJBCA_PWD
  # Default
  default_pass: $DEFAULT_PWD
EOF

# TODO: unset all env variables