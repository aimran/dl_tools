#!/usr/bin/env bash

# Run as root

set -e

apt-get update
apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

apt-get update
apt-get install -y docker-ce

# add ubuntu to docker
usermod -a -G docker $USER
