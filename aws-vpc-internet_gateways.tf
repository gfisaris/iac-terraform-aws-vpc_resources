resource "aws_internet_gateway" "master" {
  count   = "${var.aws_vpc_enabled * var.aws_vpc_subnet_public_enabled}"
  vpc_id  = "${aws_vpc.master.id}"

  tags {
    Name              = "vpc_internet_gateway"
    VPC               = "${aws_vpc.master.id}"
    awsResource       = "vpc_internet_gateways"
    awsResourceGroup  = "vpc-networking"
  }
}

output "internet_gateway_id" {value = "${aws_internet_gateway.master.id}"}
