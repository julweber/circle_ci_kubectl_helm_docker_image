#!/bin/bash

DOCKER_REPO=julianweberdev
IMAGE=circleci-kubectl-helm
docker run -i -t "$DOCKER_REPO/$IMAGE" /bin/bash