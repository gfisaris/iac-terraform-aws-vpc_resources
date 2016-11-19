resource "aws_route_table" "public" {
  count   = "${var.aws_vpc_enabled * var.aws_vpc_subnet_public_enabled}"
  vpc_id  = "${aws_vpc.master.id}"

  tags {
    Name              = "public_vpc_route_table"
    VPC               = "${aws_vpc.master.id}"
    InternetAccess    = "direct"
    awsResource       = "vpc_route_tables"
    awsResourceGroup  = "vpc-networking"
  }
}

output "route_table_public_id"      {value = "${aws_route_table.public.id}"}
output "route_table_public_vpc_id"  {value = "${aws_vpc.master.id}"}

resource "aws_route_table" "private" {
  count   = "${var.aws_vpc_enabled * var.aws_vpc_subnet_private_enabled}"
  vpc_id  = "${aws_vpc.master.id}"

  tags {
    Name              = "private_vpc_route_table"
    VPC               = "${aws_vpc.master.id}"
    InternetAccess    = "via_nat_gateway"
    awsResource       = "vpc_route_tables"
    awsResourceGroup  = "vpc-networking"
  }
}

output "route_table_private_id"     {value = "${aws_route_table.private.id}"}
output "route_table_private_vpc_id" {value = "${aws_vpc.master.id}"}
