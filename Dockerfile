# circleci-kubectl-helm docker build file

# based on circleci/buildpack-deps:stretch
FROM circleci/buildpack-deps:stretch

MAINTAINER Julian Weber <julianweberdev@gmail.com>

# Arguments for image building
ARG K8S_VERSION
ARG HELM_VERSION

# BUILD ENV
ENV HELM_FILENAME=helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV BUILD_PATH=/home/circleci
WORKDIR $BUILD_PATH

# install dependencies
# install kubectl
# display kubectl version
# install helm
# display helm version
RUN sudo apt-get install ca-certificates curl gettext tar gzip \
    && wget https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl && sudo mv kubectl /usr/local/bin/kubectl && sudo chmod +x /usr/local/bin/kubectl\
    && kubectl version ||true\
    && wget https://storage.googleapis.com/kubernetes-helm/${HELM_FILENAME} && tar xfz $HELM_FILENAME && sudo mv linux-amd64/helm /usr/local/bin/helm && sudo chmod +x /usr/local/bin/helm && rm -rf $HELM_FILENAME && rm -rf linux-amd64/ \ 
    && helm version ||true

CMD ["/bin/sh"]