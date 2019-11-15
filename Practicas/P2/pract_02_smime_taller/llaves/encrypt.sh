#!/bin/bash

openssl enc -base64 -in $1 -out $1.base64

openssl smime -sign -in $1.base64 -out $1.base64.sgn -signer eve.cert.pem -inkey eve.key.pem -text

openssl smime -encrypt -in $1.base64.sgn -out $1.base64.sgn.enc bob.cert.pem
