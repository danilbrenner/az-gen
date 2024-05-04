#!/bin/bash

if [ -z $DOMAIN ]
then
    echo "Variable DOMAIN is not set"
    exit 1
fi 

certbot certonly --manual --manual-public-ip-logging-ok \
          --preferred-challenges=http \
          --manual-auth-hook "./helper.sh auth" \
          --manual-cleanup-hook "./helper.sh cleanup" \
          --key-type rsa \
          -d $DOMAIN \
        #   --dry-run

[ ! -d '/cert' ] && mkdir /cert

openssl pkcs12 -export \
          -out /cert/newcert.pfx \
          -inkey /etc/letsencrypt/live/$DOMAIN/privkey.pem \
          -in /etc/letsencrypt/live/$DOMAIN/cert.pem
