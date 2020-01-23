#!/bin/bash

DOCKER_REPO=julianweberdev
IMAGE=circleci-kubectl-helm
TAG=latest
docker run -i -t "$DOCKER_REPO/$IMAGE:$TAG" /bin/bash