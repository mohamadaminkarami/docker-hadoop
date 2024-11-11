#!/bin/bash
if [ "$1" == '--eval' ]; then
    export RELEASE="eval"
else
    export RELEASE="latest"
fi

# Set the Docker username
export DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME:-binpash}

# Run the containers
# https://docs.docker.com/compose/migrate
docker-compose up -d || docker compose up -d
