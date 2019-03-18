#!/usr/bin/env bats

@test "Responds OK to GET /boards" {
    run  http GET :8080/boards -h --pretty none
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

@test "Responds OK to POST /boards" {
    run  http POST :8080/boards -h --pretty none
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}