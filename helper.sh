#!/bin/bash

[ ! -d './tmp' ] && mkdir tmp

if [ -z $1 ] 
then
    echo "Mode not set!"
    exit 1
fi 

if [ -z $AZURE_STORAGE_ACCOUNT ] 
then
    echo "Variable AZURE_STORAGE_ACCOUNT is not set"
    exit 1
fi 

if [ -z $AZURE_STORAGE_KEY ] 
then
    echo "Variable AZURE_STORAGE_KEY is not set"
    exit 1
fi 

if [ "$1" = "auth" ]
then
    if [ -z $CERTBOT_VALIDATION ] 
    then
        echo "Variable CERTBOT_VALIDATION is not set"
        exit 1
    fi 

    if [ -z $CERTBOT_TOKEN ] 
    then
        echo "Variable CERTBOT_TOKEN is not set"
        exit 1
    fi 
    
    echo $CERTBOT_VALIDATION > ./tmp/$CERTBOT_TOKEN

    az storage blob upload-batch \
        --overwrite \
        --destination '$web' \
        --source ./tmp \
        --destination-path '.well-known/acme-challenge' \
        --auth-mode key

    exit 0
elif [ "$1" = "cleanup" ]
then
    az storage blob delete-batch \
        --source '$web' \
        --pattern '.well-known/acme-challenge/*' \
        --auth-mode key

    rm -rf tmp/

    exit 0
else
    echo "Unknown mode"
    exit 1
fi