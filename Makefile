all: build

build: init
	docker build -t hweicdl/netcat-tcp:$(TAG) -f Dockerfile_TCP .
	docker build -t hweicdl/netcat-ucp:$(TAG) -f Dockerfile_UDP .

push: build
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push hweicdl/netcat-tcp:$(TAG)
	docker push hweicdl/netcat-ucp:$(TAG)

.PHONY: all build push