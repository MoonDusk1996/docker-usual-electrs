#!/bin/bash

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git."
    exit 1
fi

if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Please install Docker ."
    exit 1
fi

git clone https://github.com/MoonDusk1996/docker-electrs-server.git docker-electrs-server
cd docker-electrs-server

docker build -t electrs:latest .

echo "Please check electrs.conf at: $(pwd)/electrs_data. 
After configuring, upload your container by running: 
docker run -v <path_the_electrs_data>:/electrs electrs:latest"
