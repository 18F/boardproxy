#!/usr/bin/env bats

setup() {
    docker run --name board-ok -p 8080:80 \
        -v $(pwd)/test/ok.html:/usr/share/nginx/html/ok.html \
        -v $(pwd)/test/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
}

teardown() {
    docker rm -f board-ok
}

@test "Responds OK to GET /boards" {
    run  http GET :8080/boards -h --pretty none
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

@test "Responds OK to POST /boards" {
    run  http POST :8080/boards -h --pretty none
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}