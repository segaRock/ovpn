#!/usr/bin/env bash

docker run --cap-add=NET_ADMIN \
-v openvpn_conf:/opt/Dockovpn \
-p 443:443/tcp -p 80:8080/tcp \
-e HOST_ADDR=localhost \
--rm \
s3rg/openvpn "$@"
