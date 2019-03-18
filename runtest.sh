#!/bin/sh

docker rm -f board-test
docker run --name board-test -p 8080:80 \
    -v $(pwd)/test/ok.html:/usr/share/nginx/html/ok.html \
    -v $(pwd)/test/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx

bats -r ./test/

docker rm -f board-test