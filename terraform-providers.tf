provider "aws" {
  access_key = "${var.tf_provider_aws_access_key}"
  secret_key = "${var.tf_provider_aws_secret_key}"
  region     = "${var.tf_provider_aws_region}"
}
