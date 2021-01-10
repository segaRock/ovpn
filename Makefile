export FULL_VESRION="$$(cat ./VERSION)-regen-dh"

.PHONY: build build-local build-dev build-test install clean test run

all: build test

build:
	@echo "Making production version ${FULL_VESRION} of DockOvpn"
	docker build -t s3rg/openvpn:${FULL_VESRION} -t s3rg/openvpn:latest . --no-cache
	docker push s3rg/openvpn:${FULL_VESRION}
	docker push s3rg/openvpn:latest

build-local:
	@echo "Making version of DockOvpn for testing on local machine"
	docker build -t s3rg/openvpn:local . --no-cache

build-dev:
	@echo "Making development version of DockOvpn"
	docker build -t s3rg/openvpn:dev . --no-cache
	docker push s3rg/openvpn:dev

build-test:
	@echo "Making testing version of DockOvpn"
	docker build -t s3rg/openvpn:test . --no-cache
	docker push s3rg/openvpn:test

install:
	@echo "Installing DockOvpn ${FULL_VESRION}"

clean:
	@echo "Making cleanup"
	docker rm dockovpn

test:
	@echo "Running tests for DockOvpn ${FULL_VESRION}"

run:
	docker run --cap-add=NET_ADMIN \
	-v openvpn_conf:/opt/Dockovpn \
	-p 443:443/tcp -p 80:8080/tcp \
	-e HOST_ADDR=localhost \
	--rm \
	s3rg/openvpn
