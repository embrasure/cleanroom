FROM alpine:latest

MAINTAINER Luke Sigler <lukesigler@outlook.com>

ENV CUSTOM_CA false

RUN apk update && apk add \
    curl \
    git \
    zip \
    ca-certificates \
	python \
	py-pip \
	&& rm -rf /var/cache/apk/*

RUN pip install httpie httpie-unixsocket httpie-oauth httpie-http2

#RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.1/goss-linux-amd64 > /usr/local/bin/goss && chmod +rx /usr/local/bin/goss

ADD docker-entrypoint.sh /tmp/docker-entrypoint.sh

RUN chmod +x /tmp/docker-entrypoint.sh

#RUN mkdir /tmp/goss

WORKDIR /scratch

ENTRYPOINT ["/tmp/docker-entrypoint.sh"]