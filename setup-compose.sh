#!/bin/bash

# Initialize variables
export RELEASE="latest"
export SOURCE="binpash/"

for arg in "$@"; do
    if [ "$arg" == '--rebuild' ]; then
        export RELEASE="eval"
        export SOURCE=""

        echo "Rebuilding Docker images..."
        make build || {
            echo "Build failed"
            exit 1
        }
    fi
done

# Bring up the services
echo "Starting Docker Compose services..."
# https://docs.docker.com/compose/migrate
docker-compose up -d || docker compose up -d
