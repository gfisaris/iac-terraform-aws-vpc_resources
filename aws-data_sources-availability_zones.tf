data "aws_availability_zones" "aws_account_az" {}

output "aws_account_az" {
	value = ["${data.aws_availability_zones.aws_account_az.names}"]
}
