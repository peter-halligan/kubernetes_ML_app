#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
PATCH=$1
version=1.0.${PATCH}
dockerpath="phalligan/kubernetes-ml-app:${version}"
# Step 2
# Run the Docker Hub container with kubernetes

kubectl run kubernetes-ml-app\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=ml-app

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to host
kubectl port-forward kubernetes-ml-app 8000:80
