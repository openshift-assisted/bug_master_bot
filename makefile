CONTAINER_CMD := $(or $(CONTAINER_CMD), $(shell command -v podman 2> /dev/null))
ifndef CONTAINER_CMD
CONTAINER_CMD := docker
endif

BUG_MASTER_IMAGE := $(or $(BUG_MASTER_IMAGE), quay.io/eerez/bug_master_bot)
BUG_MASTER_TAG := $(or $(BUG_MASTER_TAG),latest)

build-image:
	$(CONTAINER_CMD) build $(CONTAINER_BUILD_EXTRA_PARAMS) -t $(BUG_MASTER_IMAGE):$(BUG_MASTER_TAG) .
