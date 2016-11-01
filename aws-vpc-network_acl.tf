resource "aws_network_acl" "public" {
  count   = "${var.aws_vpc_app_enabled}"
  vpc_id  = "${aws_vpc.app.id}"
}
