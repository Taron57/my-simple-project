#!/bin/bash

# Exit immediately on error
set -e

# Usage message
usage() {
  echo "Usage: $0 <dockerhub_username> <dockerhub_password> <dockerfile_path> <image_repository_name> <image_tag>"
  exit 1
}

# Check for required arguments
if [ "$#" -ne 5 ]; then
  usage
fi

# Input parameters
DOCKERHUB_USERNAME="$1"
DOCKERHUB_PASSWORD="$2"
DOCKERFILE_PATH="$3"
IMAGE_REPO="$4"
IMAGE_TAG="$5"

# Build full image name
IMAGE_NAME="${DOCKERHUB_USERNAME}/${IMAGE_REPO}:${IMAGE_TAG}"

echo "🔨 Building Docker image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE_PATH" . || { echo "❌ Build failed"; exit 1; }

echo "🔑 Logging in to Docker Hub..."
echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin || { echo "❌ Login failed"; exit 1; }

echo "📤 Pushing image to Docker Hub: $IMAGE_NAME"
docker push "$IMAGE_NAME" || { echo "❌ Push failed"; exit 1; }

echo "✅ Successfully built and pushed: $IMAGE_NAME"
