data "terraform_remote_state" "aws_dcs" {
  backend = "local"
  config {
    path = "${path.module}/../../aws-data_sources/master/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_vpc" {
    backend = "local"
    config {
        path = "${path.module}/../../aws-vpc/master/terraform.tfstate"
    }
}

data "terraform_remote_state" "aws_iam" {
  backend = "local"
  config {
    path = "${path.module}/../../aws-iam/master/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_ec2_alb" {
  backend = "local"
  config {
    path = "${path.module}/../../aws-ec2-alb/master/terraform.tfstate"
  }
}


data "terraform_remote_state" "aws_ecs" {
  backend = "local"
  config {
    path = "${path.module}/../../aws-ecs/master/terraform.tfstate"
  }
}
