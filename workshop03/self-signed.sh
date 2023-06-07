#!/bin/bash
# Generate Private Key
#openssl genrsa -out code.pem 4096

# LibreSSL 2.8.3 on OSX does not support -addext.
#  Generate CSR
openssl req -new -key code.pem -out code.csr \
	-subj '/CN=code-104.248.98.2.nip.io' \
	-addext 'subjectAltName = DNS:foo.com IP:104.248.98.2' \
	-addext 'keyUsage = keyEncipherment, digitalSignature' \
	-addext 'extendedKeyUsage = serverAuth'

