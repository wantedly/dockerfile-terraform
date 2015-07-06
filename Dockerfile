FROM debian:jessie
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)
CMD ["/usr/local/bin/terraform", "version"]

ENV TERRAFORM_VERSION 0.6.0

RUN apt-get update \
    && apt-get install -y \
      libcurl4-openssl-dev \
      unzip \
      curl \
    && mkdir -p /tmp/terraform \
    && cd /tmp/terraform \
    && curl -L https://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > \
      terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform* /usr/local/bin/ \
    && rm -rf /tmp/terraform \
    && apt-get purge -y curl unzip

VOLUME ["/terraform"]
WORKDIR /terraform
