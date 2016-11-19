resource "aws_network_acl" "public" {
  count       = "${var.aws_vpc_enabled * var.aws_vpc_subnet_public_enabled}"
  vpc_id      = "${aws_vpc.master.id}"
  subnet_ids  = ["${aws_subnet.public.*.id}"]
}

output "network_acl_public_id" {value = "${aws_network_acl.public.id}"}

resource "aws_network_acl" "private" {
  count       = "${var.aws_vpc_enabled * var.aws_vpc_subnet_private_enabled}"
  vpc_id      = "${aws_vpc.master.id}"
  subnet_ids  = ["${aws_subnet.private.*.id}"]
}

output "network_acl_private_id" {value = "${aws_network_acl.private.id}"}
