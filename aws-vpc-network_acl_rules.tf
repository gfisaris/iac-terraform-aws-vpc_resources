/*
resource "aws_network_acl_rule" "ingress_deny_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "*"
  rule_action     = "deny"
  egress          = false
  protocol        = "all"    
  cidr_block      = "0.0.0.0/0"
}
*/
resource "aws_network_acl_rule" "ingress_allow_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = false
  protocol        = "all"    
  cidr_block      = "0.0.0.0/0"
}
/*
resource "aws_network_acl_rule" "egress_deny_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "*"
  rule_action     = "deny"
  egress          = true
  protocol        = "all"    
  cidr_block      = "0.0.0.0/0"
}
*/
resource "aws_network_acl_rule" "egress_allow_all" {
  count           = "${var.aws_vpc_app_enabled}"
  network_acl_id  = "${aws_network_acl.public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = true
  protocol        = "all"    
  cidr_block      = "0.0.0.0/0"
}
