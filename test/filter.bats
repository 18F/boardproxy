#!/usr/bin/env bats

http="http -h --pretty=none"

200_test() {
    run $http $request
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
    run $http $request -b
    [[ ${lines[0]} =~ "BOARD" ]]
}

@test "Responds OK to GET /boards" {
    request="GET :8080/boards"
    200_test
}

@test "Responds OK to POST board update" {
    request="POST :8080/1/boards/5c8acc11bc371f1558970c98/markAsViewed"
    200_test
}

@test "Responds 200 OK to GET /1/boards" {
    request="GET :8080/1/boards"
    200_test
}

@test "Responds 403 forbidden to POST board creation" {
    run $http POST :8080/1/boards body="board creation"
    [[ ${lines[0]} =~ "HTTP/1.1 403 Forbidden" ]]
}

@test "Responds 403 forbidden to POST team creation" {
    run $http POST :8080/1/organizations body="team creation"
    [[ ${lines[0]} =~ "HTTP/1.1 403 Forbidden" ]]
}

@test "Responds 403 forbidden to GET power-ups" {
    run $http GET :8080/b/a2c4d6g8/some-name/power-ups
    [[ ${lines[0]} =~ "HTTP/1.1 403 Forbidden" ]]
}

@test "Responds 403 forbidden POST new power-ups" {
    run $http POST :8080/1/boards/5c8ac57b/boardPlugins
    [[ ${lines[0]} =~ "HTTP/1.1 403 Forbidden" ]]
}

