resource "aws_route" "igateway" {
  count                   = "${var.aws_vpc_app_enabled}"
  route_table_id          = "${aws_route_table.public.id}"
  gateway_id              = "${aws_internet_gateway.master.id}"
  destination_cidr_block  = "0.0.0.0/0"
}

resource "aws_route" "nat_gateway" {
  count                   = "${var.aws_vpc_app_enabled}"
  route_table_id          = "${aws_route_table.private.id}"
  gateway_id              = "${aws_nat_gateway.master.id}"
  destination_cidr_block  = "0.0.0.0/0"
}
