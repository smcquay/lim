GOFILES := $(shell find . -type f | grep go$$ )

build/lim: build ${GOFILES}
	docker build -t smcquay/lim:build . -f Dockerfile.build
	docker create --name ext smcquay/lim:build
	docker cp ext:/usr/local/bin/lim build/
	docker rm -f ext
	docker image rm smcquay/lim:build

build:
	@mkdir build

.PHONY: docker-image
docker-image: build/lim
	docker build --no-cache -t smcquay/lim:latest  .

.PHONY: clean
clean:
	@rm -rf build
