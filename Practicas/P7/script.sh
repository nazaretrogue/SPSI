#!/bin/bash

cd root/ca

# Modificamos el archivo de configuración añadiendo a intermediate/openssl.cnf
# crlDistributionPoints = URI:http://example.com/intermediate.crl.pem
atom intermediate/openssl.cnf

# Creamos la lista de revocación de certificados
openssl ca -config intermediate/openssl.cnf -gencrl -out intermediate/crl/intermediate.crl.pem
openssl crl -in intermediate/crl/intermediate.crl.pem -noout -text

# Creamos una llave para Bob
cd ../..
mkdir bob
cd bob
openssl genrsa -out bob@example.com.key.pem 2048
openssl req -new -key bob@example.com.key.pem -out bob@example.com.csr.pem

# Creamos el certificado para Bob firmado por la CA
cd ../root/ca/
cp ../../bob/bob@example.com.csr.pem intermediate/csr/
openssl ca -config intermediate/openssl.cnf -extensions usr_cert -notext -md sha256 -in intermediate/csr/bob@example.com.csr.pem -out intermediate/certs/bob@example.com.cert.pem -subj "/CN=bob@example.com"

# Verifica el certificado
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem intermediate/certs/bob@example.com.cert.pem
cat intermediate/index.txt

# Revocamos el certificado
openssl ca -config intermediate/openssl.cnf -revoke intermediate/certs/bob@example.com.cert.pem 
cat intermediate/index.txt

# Lista de revocación de certificados en el cliente
openssl x509 -in cute-kitten-pictures.example.com.cert.pem -noout -text
