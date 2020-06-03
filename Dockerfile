FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget curl jq git mysql-client unzip yamllint
ENV CF_CLI_VERSION "6.51.0"
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -xz -C /usr/local/bin
RUN wget https://github.com/orange-cloudfoundry/cf-plugin-bg-restage/releases/download/v1.1.0/cf-plugin-bg-restage_linux_amd64 -O /usr/local/bin/cf-plugin-bg-restage && chmod +x /usr/local/bin/cf-plugin-bg-restage
RUN cf install-plugin /usr/local/bin/cf-plugin-bg-restage -f
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && chmod +x /usr/local/bin/mc
ENV OM_CLI_VERSION "5.0.0"
RUN wget "https://github.com/pivotal-cf/om/releases/download/${OM_CLI_VERSION}/om-linux-${OM_CLI_VERSION}" -O /usr/local/bin/om && chmod +x /usr/local/bin/om
ENV BOSH_CLI_VERSION "6.2.1"
RUN wget https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/bosh-cli-${BOSH_CLI_VERSION}-linux-amd64 -O /usr/local/bin/bosh && chmod +x /usr/local/bin/bosh
RUN apt-get install -y ruby-full python3 python3-pip && pip3 install awscli --upgrade
RUN wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && unzip terraform_0.11.14_linux_amd64.zip && mv terraform /usr/local/bin
ENV YQ_VERSION "3.3.0"
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -O /usr/local/bin/yq && chmod +x /usr/local/bin/yq
