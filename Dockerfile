FROM debian:jessie

MAINTAINER Luke Sigler <lukesigler@outlook.com>

RUN apt-get -y update && \
    apt-get install -y curl git zip httpie gettext-base build-essential ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.1/goss-linux-amd64 > /usr/local/bin/goss && chmod +rx /usr/local/bin/goss

RUN mkdir /tmp/goss

RUN mkdir /scratch

RUN update-ca-certificates