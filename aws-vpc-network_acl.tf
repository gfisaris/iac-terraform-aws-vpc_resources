resource "aws_network_acl" "public" {
  count       = "${var.aws_vpc_app_enabled}"
  vpc_id      = "${aws_vpc.app.id}"
  subnet_ids  = ["${aws_subnet.public.*.id}"]
}

resource "aws_network_acl" "private" {
  count       = "${var.aws_vpc_app_enabled}"
  vpc_id      = "${aws_vpc.app.id}"
  subnet_ids  = ["${aws_subnet.private.*.id}"]
}
