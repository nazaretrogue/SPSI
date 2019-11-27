#!/bin/bash

# Preparación de la infraestructura de directorios
mkdir -p root/ca
cd root/ca
mkdir certs crl newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial

# Modificación del archivo de configuración

atom openssl.cnf
pwd

# Creamos la clave de root
openssl genrsa -aes256 -out private/ca.key.pem 4096
chmod 400 private/ca.key.pem

# Creamos el certificado de root
openssl req -config openssl.cnf -key private/ca.key.pem -new -x509 -days 7300 -sha256 \
        -extensions v3_ca -out certs/ca.cert.pem
chmod 444 certs/ca.cert.pem

# Verificamos el certificado
openssl x509 -noout -text -in certs/ca.cert.pem
