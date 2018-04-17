GOFILES := $(shell find . -type f | grep go$$ )

build/lim: build build/.docker-image ${GOFILES}
	@echo "fetching binary from image"
	@docker create --name ext smcquay/lim:latest > /dev/null
	@docker cp ext:/bin/lim build/ > /dev/null
	@docker rm -f ext > /dev/null
	@touch build/lim

build/.docker-image: ${GOFILES}
	@echo "building docker image"
	@docker build --no-cache -t smcquay/lim:latest . > /dev/null
	@touch build/.docker-image

build:
	@mkdir build

.PHONY: clean
clean:
	@rm -rf build
