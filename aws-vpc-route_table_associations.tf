resource "aws_route_table_association" "rtbl_public" {
  count           = "${var.aws_vpc_subnets_pub_count * var.aws_vpc_app_enabled}"
  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id  = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "rtbl_private" {
  count           = "${var.aws_vpc_subnets_prv_count * var.aws_vpc_app_enabled}"
  subnet_id       = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id  = "${aws_route_table.private.id}"
}
