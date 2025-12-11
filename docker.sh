#!/bin/bash
set -eux
apt-get update
apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
        python-is-python3 zip python3-simplejson \
        gnupg2 \
        software-properties-common
apt-get install -y default-jre default-jdk git

curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/v2.11.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

usermod -G docker vagrant
