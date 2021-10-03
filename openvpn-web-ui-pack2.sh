#!/bin/bash -x

set -e

time docker run \
    -v "/home/pi/openvpn-web-ui/":/go/src/github.com/adamwalach/openvpn-web-ui \
    -e GO111MODULE='auto' \
    --rm \
    -w /usr/src/myapp \
    local/beego-v8 \
    sh -c "cd /go/src/github.com/adamwalach/openvpn-web-ui/ && bee version && bee pack -exr='^vendor|^data.db|^build|^README.md|^docs'"
