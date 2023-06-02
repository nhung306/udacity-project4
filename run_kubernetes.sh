#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="nhungtrinh/udacity_project4:latest"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-project4\
    --image=$dockerpath\
    
    --port=80 --labels app=udacity-project4\
    --restart=Never


# Step 3:
# List kubernetes pods
kubectl wait --for=condition=ready pod --all
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-project4 8000:80

