#!/bin/bash

openssl smime -sign -in pract_02_smime.pdf -out pract_02_smime.pdf.sgn -signer eve.cert.pem -inkey eve.key.pem -binary


openssl smime -encrypt -in pract_02_smime.pdf.sgn -binary -out pract_02_smime.pdf.sgn.enc bob.cert.pem

openssl smime -decrypt -in pract_02_smime.pdf.sgn.enc -out pract_02_smime_desen.pdf.sgn -recip bob.cert.pem -inkey bob.key.pem -binary

# openssl smime -verify -noverify -binary -in pract_02_smime.pdf.sgn.enc -out pract_02_smime_ver.pdf.enc
