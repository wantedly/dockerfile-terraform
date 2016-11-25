FROM alpine:3.4

ENV TERRAFORM_VERSION 0.7.8
ENV GLIBC_VERSION 2.23-r3

RUN apk add --no-cache --update ca-certificates unzip wget \
    && wget -qO /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
    && wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add --no-cache glibc-${GLIBC_VERSION}.apk \
    && wget -qO /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && unzip /terraform.zip -d /bin \
    && apk del --purge unzip wget \
    && rm -rf glibc-${GLIBC_VERSION}.apk /terraform.zip

VOLUME ["/terraform"]
WORKDIR /terraform
