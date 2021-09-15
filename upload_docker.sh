#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub



# Step 1:
# Create dockerpath
dockerpath=wardahsana/capstone

# Step 2:  
# Authenticate & tag
docker login --username wardahsana
docker tag capstone $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
