#!/bin/bash

# Preparamos la infraestructura de directorios para intermediate
mkdir root/ca/intermediate
cd root/ca/intermediate
mkdir certs crl csr newcerts private
chmod 700 private
touch index.txt
echo 1000 > {serial, crlnumber}

# Modificamos el archivo de configuración
atom intermediate/openssl.cnf

# Creamos la clave intermediate
openssl genrsa -aes256 -out intermediate/private/intermediate.key.pem 4096
chmod 400 intermediate/private/intermediate.key.pem

# Creamos el certificado intermediate
openssl req -config intermediate/openssl.cnf -new -sha256 -key intermediate/private/intermediate.key.pem \
        -out intermediate/csr/intermediate.csr.pem
openssl ca -config openssl.cnf -extensions v3_intermediate_ca -days 3650 -notext
        -md sha256 -in intermediate/csr/intermediate.csr.pem -out intermediate/certs/intermediate.cert.pem \
        -subj "/C=GB/CN=Alice/ST=England/O=Alice Ltd"
chmod 444 intermediate/certs/intermediate.cert.pem

# Verificamos
openssl verify -CAfile certs/ca.cert.pem intermediate/certs/intermediate.cert.pem

# Creamos una cadena de certificados
cat intermediate/certs/intermediate.cert.pem certs/ca.certs.pem > intermediate/certs/ca-chain.cert.pem
chmod 444 intermediate/certs/ca-chain.cert.pem
