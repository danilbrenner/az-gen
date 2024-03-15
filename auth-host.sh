#!/bin/bash

if [ -z "$1" ]
  then
    echo "Account name is not supplied"
    exit 1
fi

[ ! -d './tmp' ] && mkdir tmp

echo $CERTBOT_VALIDATION > ./tmp/$CERTBOT_TOKEN

sudo az storage blob upload-batch \
    --overwrite \
    --destination '$web' \
    --source ./tmp \
    --destination-path '.well-known/acme-challenge' \
    --account-name $1 \
    --auth-mode login
