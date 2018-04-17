GOFILES := $(shell find . -type f | grep go$$ )

build/lim: build ${GOFILES}
	@docker build -t smcquay/lim:build . -f Dockerfile.build > /dev/null
	@docker create --name ext smcquay/lim:build > /dev/null
	@docker cp ext:/usr/local/bin/lim build/ > /dev/null
	@docker rm -f ext > /dev/null
	@docker image rm smcquay/lim:build > /dev/null

build:
	@mkdir build

.PHONY: docker-image
docker-image: build/lim
	@docker build --no-cache -t smcquay/lim:latest  . > /dev/null

.PHONY: clean
clean:
	@rm -rf build
