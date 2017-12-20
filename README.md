# pcf_tools
Pivotal Cloud Foundry toolset for use in Concourse pipelines
# Dockerfile
FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget jq
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin
