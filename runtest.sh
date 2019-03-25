#!/bin/sh

docker-compose up -d
bats -r ./test/
docker-compose down

