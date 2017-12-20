FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget curl jq
ENV CF_CLI_VERSION "6.33.0"
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -xz -C /usr/local/bin
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin
