#!/bin/bash

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git."
    exit 1
fi

if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Please install Docker ."
    exit 1
fi

git clone https://github.com/MoonDusk1996/docker_electrs.git docker_electrs
cd docker_electrs

docker build -t electrs:latest .

echo "Please check electrs.conf at: $(pwd)/electrs_data. 
After configuring, upload your container by running: 
docker run -v <path_the_electrs_data>:/electrs electrs:latest"
