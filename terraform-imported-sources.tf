data "terraform_remote_state" "project" {
  backend = "local"
  config {
    path = "${path.module}/../project/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_ds" {
  backend = "local"
  config {
    path = "${path.module}/../aws-data_sources/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_vpc" {
  backend = "local"
  config {
      path = "${path.module}/../aws-vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_iam" {
  backend = "local"
  config {
    path = "${path.module}/../aws-iam/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_ec2" {
  backend = "local"
  config {
    path = "${path.module}/../aws-ec2/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_ec2_alb" {
  backend = "local"
  config {
    path = "${path.module}/../aws-ec2-alb/terraform.tfstate"
  }
}


data "terraform_remote_state" "aws_ecs" {
  backend = "local"
  config {
    path = "${path.module}/../aws-ecs/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_efs" {
  backend = "local"
  config {
    path = "${path.module}/../aws-efs/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_cloudwatch" {
  backend = "local"
  config {
    path = "${path.module}/../aws-cloudwatch/terraform.tfstate"
  }
}
