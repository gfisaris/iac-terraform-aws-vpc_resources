data "aws_availability_zones" "aws_region_az" {}

output "aws_region_az" {
	value = ["${data.aws_availability_zones.aws_region_az.names}"]
}
