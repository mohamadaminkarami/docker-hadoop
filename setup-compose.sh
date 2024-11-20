#!/bin/bash
if [ "$1" == '--eval' ]; then
    export RELEASE="eval"
else
    export RELEASE="latest"
fi

# https://docs.docker.com/compose/migrate
docker-compose up -d || docker compose up -d
