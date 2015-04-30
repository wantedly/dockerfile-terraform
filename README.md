# Terraform Docker Image [![Docker Repository on Quay.io](https://quay.io/repository/wantedly/terraform/status "Docker Repository on Quay.io")](https://quay.io/repository/wantedly/terraform)
Docker Image for [Terraform](https://terraform.io).
Please see [official document](https://terraform.io/docs/index.html) for more information about Terraform.

## SUPPORTED TAGS

* `latest`
 * Terraform 0.4.2

## HOW TO USE

```bash
# Get the Docker image
$ docker pull quay.io/wantedly/terraform:latest

# Prepare .tf files
$ ls terraform
aws.tf s3.tf rds.tf

# Run `terraform plan`
$ docker run \
    --rm \
    -it \
    -e AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXX \
    -e AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxx \
    -e AWS_DEFAULT_REGION=ap-northeast-1 \
    -v /path/to/terraform:/terraform \
    quay.io/wantedly/terraform:latest \
    terraform plan

# Run `terraform apply`
$ docker run \
    --rm \
    -it \
    -e AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXX \
    -e AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxx \
    -e AWS_DEFAULT_REGION=ap-northeast-1 \
    -v /path/to/terraform:/terraform \
    quay.io/wantedly/terraform:latest \
    terraform apply
```

## LICENSE

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
