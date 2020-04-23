#!/bin/bash

set -euo pipefail

# Configuration (adjust as needed)
export DOCKER_REPO=julianweberdev/circleci-kubectl-helm
export K8S_VERSION="v1.18.0"
export HELM_VERSION="v2.16.6"
export HELM3_VERSION="v3.2.0"

export TAG="k${K8S_VERSION}-h${HELM_VERSION}-h3${HELM3_VERSION}"

# Build image
docker build -t ${DOCKER_REPO}:${TAG} \
    --build-arg K8S_VERSION=${K8S_VERSION} \
    --build-arg HELM_VERSION=${HELM_VERSION} \
    --build-arg HELM3_VERSION=${HELM3_VERSION} .

docker tag ${DOCKER_REPO}:${TAG} ${DOCKER_REPO}:latest

# Push image
docker push ${DOCKER_REPO}:${TAG}

# uncomment this if you want to push to latest
# docker push ${DOCKER_REPO}:latest
