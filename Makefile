REPO=fyndiq
NAME=docker-elasticsearch-kubernetes
TAG=elasticsearch6.2.4-xpack

build:
	docker build -t $(REPO)/$(NAME):$(TAG) .

run:
	docker run -it --rm $(REPO)/$(NAME):$(TAG)

push: build
	docker push $(REPO)/$(NAME):$(TAG)
