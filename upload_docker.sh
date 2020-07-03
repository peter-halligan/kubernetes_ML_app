#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`
# to upload an image ensure that DOCKER_USERNAME and DOCKER PASSWORD are set
# $ export DOCKER_USERNAME=username
# $ export DOCKER_PASSWORD=password
# expects 1 arg image name user/repo 
#  ./upload_docker.sh phalligan/kubernetes-ml-app

# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=phalligan/kubernetes-ml-app
version=$2

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD
docker tag "$dockerpath:$version" "$dockerpath:latest"

# Step 3:
# Push image to a docker repository

docker push "$dockerpath:$version"
docker push "$dockerpath:latest"

