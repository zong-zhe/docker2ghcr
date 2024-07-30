# Use the official Golang image as the base image
FROM golang:1.22

# Set the working directory inside the container
WORKDIR /app

# Install wget
RUN apt-get update && apt-get install -y wget

# Install the kcl CLI tool using the provided script
RUN wget -q https://kcl-lang.io/script/install-cli.sh -O - | /bin/bash

# Set the entry point for the container
ENTRYPOINT ["kcl"]