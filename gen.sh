#!/bin/bash

domain=<>
appid=<>
secret=<>
tenant=<>
account_name=<>

az login --service-principal -u $appid -p $secret --tenant $tenant

sudo certbot certonly --manual --manual-public-ip-logging-ok \
          --preferred-challenges=http \
          --manual-auth-hook "./auth-host.sh $account_name" \
          --manual-cleanup-hook "./cleanup-host.sh $account_name" \
          --key-type rsa \
          -d $domain \
        #   --dry-run

[ ! -d './cert' ] && mkdir cert

sudo openssl pkcs12 -export \
            -out ./cert/newcert.pfx \
            -inkey /etc/letsencrypt/live/$domain/privkey.pem \
            -in /etc/letsencrypt/live/$domain/cert.pem

sudo az logout
