resource "aws_route_table_association" "public" {
  count           = "${var.aws_vpc_subnet_public_count * var.aws_vpc_subnet_public_enabled * var.aws_vpc_enabled}"
  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id  = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  count           = "${var.aws_vpc_subnet_private_count * var.aws_vpc_subnet_private_enabled * var.aws_vpc_enabled}"
  subnet_id       = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id  = "${aws_route_table.private.id}"
}
