FROM ubuntu:14.04
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

ENV TERRAFORM_VERSION 0.5.0

RUN apt-get update && \
    apt-get install -y \
      libcurl4-openssl-dev \
      git \
      unzip \
      curl && \
    mkdir -p /tmp/terraform && \
    cd /tmp/terraform && \
    curl -L https://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > \
      terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform* /usr/local/bin/ && \
    rm -rf /tmp/terraform && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/terraform"]
WORKDIR /terraform

CMD ["terraform", "version"]
