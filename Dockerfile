FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget curl jq git mysql-client unzip yamllint
ENV CF_CLI_VERSION "6.46.1"
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -xz -C /usr/local/bin
RUN wget https://github.com/orange-cloudfoundry/cf-plugin-bg-restage/releases/download/v1.1.0/cf-plugin-bg-restage_linux_amd64 && chmod +x cf-plugin-bg-restage_linux_amd64 && mv cf-plugin-bg-restage_linux_amd64 /usr/local/bin
RUN cf install-plugin /usr/local/bin/cf-plugin-bg-restage_linux_amd64 -f
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin
ENV OM_CLI_VERSION "4.0.1"
RUN curl -L "https://github.com/pivotal-cf/om/releases/download/${OM_CLI_VERSION}/om-linux" -o om && chmod +x om && mv om /usr/local/bin
ENV BOSH_CLI_VERSION "6.0.0"
RUN wget https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/bosh-cli-${BOSH_CLI_VERSION}-linux-amd64 -O /usr/local/bin/bosh && chmod +x /usr/local/bin/bosh
RUN apt-get install -y ruby-full python3 python3-pip && pip3 install awscli --upgrade
RUN wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && unzip terraform_0.11.14_linux_amd64.zip && mv terraform /usr/local/bin
RUN wget https://github.com/mikefarah/yq/releases/download/2.2.1/yq_linux_amd64 && chmod +x yq_linux_amd64 && mv yq_linux_amd64 /usr/local/bin/yq
