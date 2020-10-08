FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget curl jq git mysql-client unzip yamllint ldap-utils postgresql-client netcat
ENV V_CF "6.53.0"
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${V_CF}" | tar -xz -C /usr/local/bin
RUN wget https://github.com/orange-cloudfoundry/cf-plugin-bg-restage/releases/download/v1.1.0/cf-plugin-bg-restage_linux_amd64 -O /usr/local/bin/cf-plugin-bg-restage && chmod +x /usr/local/bin/cf-plugin-bg-restage
RUN cf install-plugin /usr/local/bin/cf-plugin-bg-restage -f
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && chmod +x /usr/local/bin/mc
ENV V_OM "6.4.0"
RUN wget "https://github.com/pivotal-cf/om/releases/download/${V_OM}/om-linux-${V_OM}" -O /usr/local/bin/om && chmod +x /usr/local/bin/om
ENV V_BOSH "6.4.0"
RUN wget https://github.com/cloudfoundry/bosh-cli/releases/download/v${V_BOSH}/bosh-cli-${V_BOSH}-linux-amd64 -O /usr/local/bin/bosh && chmod +x /usr/local/bin/bosh
RUN apt-get install -y ruby-full python3 python3-pip && pip3 install awscli --upgrade
RUN wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && unzip terraform_0.11.14_linux_amd64.zip && mv terraform /usr/local/bin
ENV V_YQ "2.2.1"
RUN wget https://github.com/mikefarah/yq/releases/download/${V_YQ}/yq_linux_amd64 -O /usr/local/bin/yq && chmod +x /usr/local/bin/yq
ENV V_PACK "0.13.1"
RUN curl -sSL "https://github.com/buildpacks/pack/releases/download/v${V_PACK}/pack-v${V_PACK}-linux.tgz" | tar -C /usr/local/bin --no-same-owner -xzv pack
ENV V_CREDHUB "2.8.0"
RUN curl -sSL "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${V_CREDHUB}/credhub-linux-${V_CREDHUB}.tgz" | tar -C ~/usr/local/bin --no-same-owner -xzv ./credhub
ENV V_BBR "1.8.0"
RUN wget https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v${V_BBR}/bbr-${V_BBR}-linux-amd64 -O /usr/local/bin/bbr && chmod +x /usr/local/bin/bbr
