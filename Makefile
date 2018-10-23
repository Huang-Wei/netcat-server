all: build

build:
	docker build -t hweicdl/netcat-tcp:$(TAG) -f Dockerfile_TCP .
	docker build -t hweicdl/netcat-udp:$(TAG) -f Dockerfile_UDP .

push: build
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push hweicdl/netcat-tcp:$(TAG)
	docker push hweicdl/netcat-udp:$(TAG)

.PHONY: all build push