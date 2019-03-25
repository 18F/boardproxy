#!/usr/bin/env bats

http="http -h --pretty=none"

@test "Responds OK to GET /boards" {
    run $http GET :8080/boards
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

@test "Responds OK to board update" {
    run $http POST :8080/1/boards/5c8acc11bc371f1558970c98/markAsViewed
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

@test "Responds OK to board creation" {
    run $http POST :8080/1/boards body="board creation"
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

@test "Responds OK to team creation" {
    run $http POST :8080/1/organizations body="team creation"
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

@test "Responds OK to listing power-ups" {
    run $http GET :8080/b/5555/some-name/power-ups
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

@test "Responds OK to POST new power-ups" {
    run $http POST :8080/1/boards/5c8ac57b/boardPlugins
    [[ ${lines[0]} =~ "HTTP/1.1 200 OK" ]]
}

