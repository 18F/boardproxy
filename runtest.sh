#!/bin/sh

# The setup() and teardown() functions could be in the
# bats files but then it sets up or tears down for every
# test.

setup() {
    docker run --name board-filter -p 8080:80 \
        -v $(pwd)/test/ok.html:/usr/share/nginx/html/ok.html \
        -v $(pwd)/fixtures/filter_test.conf:/etc/nginx/nginx.conf:ro \
        -v $(pwd)/conf.d:/etc/nginx/conf.d -d nginx
}

teardown() {
    docker rm -f board-filter
}

setup
bats -r ./test/
teardown

