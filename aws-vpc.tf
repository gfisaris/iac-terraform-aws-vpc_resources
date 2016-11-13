resource "aws_vpc" "ecs_cluster" {
  count                 = "${var.aws_vpc_ecs_cluster_enabled}"
  cidr_block            = "${var.aws_vpc_ecs_cluster_cidr_block}"
  enable_classiclink    = "${var.aws_vpc_ecs_cluster_enable_classiclink}"
  enable_dns_support    = "${var.aws_vpc_ecs_cluster_enable_dns_support}"
  enable_dns_hostnames  = "${var.aws_vpc_ecs_cluster_enable_dns_hostnames}"

  tags {
    Name                  = "ecs_cluster_vpc"
    CIDR_Block            = "${var.aws_vpc_ecs_cluster_cidr_block}"
    Enabled_ClassicLink   = "${var.aws_vpc_ecs_cluster_enable_classiclink}"
    Enabled_DNS_Support   = "${var.aws_vpc_ecs_cluster_enable_dns_support}"
    Enabled_DNS_Hostname  = "${var.aws_vpc_ecs_cluster_enable_dns_hostnames}"
    awsResource           = "vpc"
    awsResourceGroup      = "vpc-networking"
  }
}

output "ecs_cluster_vpc_id"                         {value = "${aws_vpc.ecs_cluster.id}"}
output "ecs_cluster_vpc_cidr_block"                 {value = "${aws_vpc.ecs_cluster.cidr_block}"}
output "ecs_cluster_vpc_main_route_table_id"        {value = "${aws_vpc.ecs_cluster.main_route_table_id}"}
output "ecs_cluster_vpc_default_route_table_id"     {value = "${aws_vpc.ecs_cluster.default_route_table_id}"}
output "ecs_cluster_vpc_default_network_acl_id"     {value = "${aws_vpc.ecs_cluster.default_network_acl_id}"}
output "ecs_cluster_vpc_default_security_group_id"  {value = "${aws_vpc.ecs_cluster.default_security_group_id}"}
output "ecs_cluster_vpc_instance_tenancy"           {value = "${aws_vpc.ecs_cluster.instance_tenancy}"}
output "ecs_cluster_vpc_enabled_classiclink"        {value = "${aws_vpc.ecs_cluster.enable_classiclink}"}
output "ecs_cluster_vpc_enabled_dns_support"        {value = "${aws_vpc.ecs_cluster.enable_dns_support}"}
output "ecs_cluster_vpc_enabled_dns_hostnames"      {value = "${aws_vpc.ecs_cluster.enable_dns_hostnames}"}
