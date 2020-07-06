#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>

version=$1
dockerpath="phalligan/kubernetes-ml-app:${version}"
# Step 2
# Run the Docker Hub container with kubernetes

kubectl run kubernetes-ml-app\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=ml-app
    --v=9

# Step 3:
# List kubernetes pods
n=0
until [ "$n" -ge 10 ]
do

    kubectl get pods | grep -q 'Running' && break # substitute your command here
    n=$((n+1)) 
    echo "starting."
    sleep 5
    echo "starting.."
    sleep 5 
    echo "starting..."
    sleep 5
done


# Step 4:
# Forward the container port to host
kubectl port-forward kubernetes-ml-app 8000:80


kubectl logs -f kubernetes-ml-app