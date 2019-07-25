#!/bin/sh

which bats || (echo "Need to install bats-core" && exit 1)
which http || (echo "Need to install httpie" && exit 1)

docker-compose up -d
bats -r ./test/
docker-compose down

