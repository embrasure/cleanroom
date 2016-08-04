#!/bin/sh

if $CUSTOM_CA ; then
  update-ca-certificates
fi

exec "$@"