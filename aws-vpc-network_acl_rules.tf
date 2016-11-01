resource "aws_network_acl_rule" "public-ingress_allow_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = false
  protocol        = "all"    
  cidr_block      = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "public-egress_allow_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = true
  protocol        = "all"    
  cidr_block      = "0.0.0.0/0"
}


resource "aws_network_acl_rule" "private-ingress_allow_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.private.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = false
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private-egress_allow_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.private.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = true
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}
