resource "aws_network_acl_rule" "public_ingress_allow_all" {
  count           = "${var.aws_vpc_enabled * var.aws_vpc_subnet_public_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = false
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

output "network_acl_public_ingress_allow_all_rule_id" {value = "${aws_network_acl_rule.public_ingress_allow_all.id}"}

resource "aws_network_acl_rule" "public_egress_allow_all" {
  count           = "${var.aws_vpc_enabled * var.aws_vpc_subnet_public_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = true
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

output "network_acl_public_egress_allow_all_rule_id" {value = "${aws_network_acl_rule.public_egress_allow_all.id}"}

resource "aws_network_acl_rule" "private_ingress_allow_all" {
  count           = "${var.aws_vpc_enabled * var.aws_vpc_subnet_private_enabled}"
  network_acl_id  = "${aws_network_acl.private.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = false
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

output "network_acl_private_ingress_allow_all_rule_id" {value = "${aws_network_acl_rule.private_ingress_allow_all.id}"}

resource "aws_network_acl_rule" "private_egress_allow_all" {
  count           = "${var.aws_vpc_enabled * var.aws_vpc_subnet_private_enabled}"
  network_acl_id  = "${aws_network_acl.private.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = true
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

output "network_acl_private_egress_allow_all_rule_id" {value = "${aws_network_acl_rule.private_egress_allow_all.id}"}
