FROM debian:jessie

MAINTAINER Luke Sigler <lukesigler@outlook.com>

ENV CUSTOM_CA false

RUN apt-get -y update && \
    apt-get install -y curl git zip httpie gettext-base build-essential ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.1/goss-linux-amd64 > /usr/local/bin/goss && chmod +rx /usr/local/bin/goss

ADD docker-entrypoint.sh /tmp/docker-entrypoint.sh

RUN chmod +x /tmp/docker-entrypoint.sh

RUN mkdir /tmp/goss

WORKDIR /scratch

ENTRYPOINT ["/tmp/docker-entrypoint.sh"]