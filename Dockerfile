FROM debian:jessie

MAINTAINER Luke Sigler <lukesigler@outlook.com>

RUN apt-get -y update && \
    apt-get install -y curl git zip httpie gettext-base build-essential ca-certificates && rm -rf /var/lib/apt/lists/*

# TODO: Create volume for cert authortities

RUN update-ca-certificates