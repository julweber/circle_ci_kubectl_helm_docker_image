#!/bin/bash

set -euo pipefail

# Configuration (adjust as needed)
export DOCKER_REPO=julianweberdev/circleci-kubectl-helm
export K8S_VERSION="v1.15.0"
export HELM_VERSION="v2.13.1"

export TAG="k${K8S_VERSION}-h${HELM_VERSION}"

# Build image
docker build -t ${DOCKER_REPO}:${TAG} \
    --build-arg K8S_VERSION=${K8S_VERSION} \
    --build-arg HELM_VERSION=${HELM_VERSION} .

docker tag ${DOCKER_REPO}:${TAG} ${DOCKER_REPO}:latest

# Push image
docker push ${DOCKER_REPO}:${TAG}
docker push ${DOCKER_REPO}:latest