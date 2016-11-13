resource "aws_network_acl_rule" "ecs_cluster_public_ingress_allow_all" {
  count           = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_enabled}"
  network_acl_id  = "${aws_network_acl.ecs_cluster_public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = false
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

ouput "ecs_cluster_public_vpc_network_acl_ingress_allow_all_rule_id" {value = "${aws_network_acl_rule.ecs_cluster_public_ingress_allow_all.id}"}

resource "aws_network_acl_rule" "ecs_cluster_public_egress_allow_all" {
  count           = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_enabled}"
  network_acl_id  = "${aws_network_acl.ecs_cluster_public.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = true
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

ouput "ecs_cluster_public_vpc_network_acl_egress_allow_all_rule_id" {value = "${aws_network_acl_rule.ecs_cluster_public_egress_allow_all.id}"}

resource "aws_network_acl_rule" "ecs_cluster_private_ingress_allow_all" {
  count           = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled}"
  network_acl_id  = "${aws_network_acl.ecs_cluster_private.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = false
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

ouput "ecs_cluster_private_vpc_network_acl_ingress_allow_all_rule_id" {value = "${aws_network_acl_rule.ecs_cluster_private_ingress_allow_all.id}"}

resource "aws_network_acl_rule" "ecs_cluster_private_egress_allow_all" {
  count           = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled}"
  network_acl_id  = "${aws_network_acl.ecs_cluster_private.id}"
  rule_number     = "100"
  rule_action     = "allow"
  egress          = true
  protocol        = "all"
  cidr_block      = "0.0.0.0/0"
}

ouput "ecs_cluster_private_vpc_network_acl_egress_allow_all_rule_id" {value = "${aws_network_acl_rule.ecs_cluster_private_egress_allow_all.id}"}
