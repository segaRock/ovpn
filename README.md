# ovpn

docker run --cap-add=NET_ADMIN \
-p 443:443/tcp -p 80:8080/tcp \
-e HOST_ADDR=$(curl -s https://api.ipify.org) \
--name dockovpn s3rg/openvpn
