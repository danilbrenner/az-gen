#!/bin/bash

if [ -z "$1" ]
  then
    echo "Account name is not supplied"
    exit 1
fi

sudo az storage blob delete-batch \
    --source '$web' \
    --pattern '.well-known/acme-challenge/*' \
    --account-name $1 \
    --auth-mode login

rm -rf tmp/
