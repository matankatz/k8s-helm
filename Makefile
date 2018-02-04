default: docker_build

DOCKER_IMAGE ?= quay.io/rimusz/k8s-helm
GIT_BRANCH ?= `git rev-parse --abbrev-ref HEAD`

ifeq ($(GIT_BRANCH), master)
	DOCKER_TAG = latest
else
	DOCKER_TAG = $(GIT_BRANCH)
endif

build:
	docker build \
	  --build-arg VCS_REF=`git rev-parse --short HEAD` \
	  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	  -t $(DOCKER_IMAGE):$(DOCKER_TAG) .

push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)

test:
	docker run $(DOCKER_IMAGE):$(DOCKER_TAG) version --client

all: build test push
