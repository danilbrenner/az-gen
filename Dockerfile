FROM ubuntu:latest

RUN apt-get update && apt-get install -y certbot

RUN apt-get update && apt-get install -y ca-certificates certbot curl apt-transport-https lsb-release gnupg

RUN apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg

RUN mkdir -p /etc/apt/keyrings

RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg

RUN chmod go+r /etc/apt/keyrings/microsoft.gpg

RUN AZ_DIST=$(lsb_release -cs) && echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_DIST main" | tee /etc/apt/sources.list.d/azure-cli.list 

RUN apt-get update && apt-get install azure-cli

COPY ./helper.sh scripts/
COPY ./gen.sh scripts/

RUN chmod +x /scripts/helper.sh /scripts/gen.sh

ENTRYPOINT [ "/bin/bash" ]