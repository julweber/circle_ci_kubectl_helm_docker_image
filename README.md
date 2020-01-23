# Docker Image for circle ci automation: Installed Kubectl + helm
This provides a docker image for usage within deployment automation.
It provides a preinstalled kubectl, helm2 and helm3 binaries.

## Building the image
Ensure you are logged in to your docker repository.
You can adjust the target repository by adjusting the DOCKER_REPO env variable in build.sh.
You can also adjust the kubectl and helm client versions to install here.
The build script will build the image locally and push it to the configured repository.

```
bash build.sh
```

## Using the image locally
Start a bash shell in a local container:

```
DOCKER_REPO=julianweberdev
IMAGE=circleci-kubectl-helm
TAG=latest
docker run -i -t "$DOCKER_REPO/$IMAGE:$TAG" /bin/bash
```

## Run the image locally with kubernetes
Start a bash shell in a local container:

```
DOCKER_REPO=julianweberdev
TAG=latest
IMAGE=circleci-kubectl-helm:$TAG
DEPLOYMENT=circleci-kubectl-helm-container

kubectl run -i -t --generator=deployment/apps.v1 --image=$DOCKER_REPO/$IMAGE:$TAG $DEPLOYMENT

# remove container afterwards
kubectl delete deployments/$DEPLOYMENT
```