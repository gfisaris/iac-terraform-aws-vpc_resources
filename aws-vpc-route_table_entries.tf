resource "aws_route" "igateway" {
  count                   = "${var.aws_vpc_app_enabled}"
  route_table_id          = "${aws_route_table.public.id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.gw.id}"
}
