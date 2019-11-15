#!/bin/bash

openssl smime -decrypt -in $1 -out recibido.base64.sgn -recip bob.cert.pem -inkey bob.key.pem

openssl smime -verify -text -in recibido.base64.sgn -noverify -out recibido.base64

openssl enc -d -base64 -in recibido.base64 -out recibido.pdf
