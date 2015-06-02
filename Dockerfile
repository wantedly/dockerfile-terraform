FROM gliderlabs/alpine:3.1
MAINTAINER Daisuke Fujita <dtanshi45@gmail.com> (@dtan4)

ENV TERRAFORM_VERSION 0.5.3

RUN apk --update add ca-certificates && \
    mkdir -p /tmp/terraform && \
    cd /tmp/terraform && \
    wget http://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
      -O terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform* /usr/local/bin/ && \
    rm -rf /tmp/terraform

VOLUME ["/terraform"]
WORKDIR /terraform

CMD ["/usr/local/bin/terraform", "version"]
