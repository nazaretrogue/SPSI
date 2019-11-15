#!/bin/bash

openssl enc -base64 -in smime.pdf -out smime.pdf.base64

openssl smime -sign -text -in smime.pdf.base64 -out smime.pdf.sgn -signer eve.cert.pem -inkey eve.key.pem

openssl smime -encrypt -in smime.pdf.sgn -out smime.pdf.sgn.enc bob.cert.pem

openssl smime -decrypt -in smime.pdf.sgn.enc -out smime_desenc.pdf.sgn -recip bob.cert.pem -inkey bob.key.pem

openssl smime -verify -text -in smime_desenc.pdf.sgn -noverify -out smime_desenc_verif.pdf

openssl smime -pk7out -in smime_desenc.pdf.sgn | openssl pkcs7 -print_certs -noout

openssl enc -d -base64 -in smime_desenc_verif.pdf -out smime_final.pdf
