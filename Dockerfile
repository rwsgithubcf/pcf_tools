FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget curl jq git mysql-client
ENV CF_CLI_VERSION "6.38.0"
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -xz -C /usr/local/bin
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin
ENV OM_CLI_VERSION "0.29.0"
RUN curl -L "https://github.com/pivotal-cf/om/releases/download/${OM_CLI_VERSION}/om-linux" -o om && chmod +x om && mv om /usr/local/bin
ENV BOSH_CLI_VERSION "2.0.48" # BOSH CLI
RUN curl -L "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${BOSH_CLI_VERSION}-linux-amd64" -o bosh && chmod +x bosh && mv bosh /usr/local/bin
RUN apt-get install -y python3 && python3 --version
RUN pip install --upgrade pip && pip install --upgrade awscli
