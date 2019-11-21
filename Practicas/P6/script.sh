#!/bin/bash

# Creamos una llave de un servidor
cd root/ca/
openssl genrsa -aes256 -out intermediate/private/www.example.com.key.pem 2048
chmod 400 intermediate/private/www.example.com.key.pem

# Creamos el certificado
ls -l intermediate/private/www.example.com.key.pem 
openssl req -config intermediate/openssl.cnf -key intermediate/private/www.example.com.key.pem \
		-new -sha256 -out intermediate/csr/www.example.com.csr.pem
ls -l intermediate/csr/
openssl ca -config intermediate/openssl.cnf -extensions server_cert -days 375 -notext \
		-md sha256 -in intermediate/csr/www.example.com.csr.pem -out intermediate/certs/www.example.com.cert.pem \
		-subj "/CN=www.example.com"
chmod 444 intermediate/certs/www.example.com.cert.pem 
ls -l intermediate/certs/
cat intermediate/index.txt

# Comprobamos el certificado
openssl x509 -noout -text -in intermediate/certs/www.example.com.cert.pem 
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem intermediate/certs/www.example.com.cert.pem
