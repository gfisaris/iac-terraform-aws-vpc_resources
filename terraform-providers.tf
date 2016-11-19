provider "aws" {
  region     = "${data.terraform_remote_state.project.aws_region}"
  access_key = "${data.terraform_remote_state.project.aws_access_key}"
  secret_key = "${data.terraform_remote_state.project.aws_secret_key}"
}
