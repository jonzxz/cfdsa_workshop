#!/bin/bash

# Script to spin up a single Database along with a Node app
# in a single Docker network

# Create network drive
docker network create mynet

# Create persistent volume
docker volume create myvol

# Deploy a database, without exposing port or any port binds
# Using earlier created volume
docker run -d \
    --platform linux/amd64 \
    -v myvol:/var/lib/mysql \
    --name mydb \
    --network mynet \
    stackupiss/northwind-db:v1

docker run -d \
    -p 8080:3000
    -e DB_HOST=mydb \
    -e DB_USER=root \
    -e DB_PASSWORD=changeit \
    --network mynet \
    --name myapp \
    stackupiss/northwind-app:v1
    
