resource "aws_vpc" "master" {
  count                 = "${var.aws_vpc_enabled}"
  cidr_block            = "${var.aws_vpc_cidr_block}"
  enable_classiclink    = "${var.aws_vpc_enable_classiclink}"
  enable_dns_support    = "${var.aws_vpc_enable_dns_support}"
  enable_dns_hostnames  = "${var.aws_vpc_enable_dns_hostnames}"

  tags {
    Name                  = "vpc"
    CIDR_Block            = "${var.aws_vpc_cidr_block}"
    Enabled_ClassicLink   = "${var.aws_vpc_enable_classiclink}"
    Enabled_DNS_Support   = "${var.aws_vpc_enable_dns_support}"
    Enabled_DNS_Hostname  = "${var.aws_vpc_enable_dns_hostnames}"
    awsResource           = "vpc"
    awsResourceGroup      = "vpc-networking"
  }
}

output "vpc_id"                         {value = "${aws_vpc.master.id}"}
output "vpc_cidr_block"                 {value = "${aws_vpc.master.cidr_block}"}
output "vpc_main_route_table_id"        {value = "${aws_vpc.master.main_route_table_id}"}
output "vpc_default_route_table_id"     {value = "${aws_vpc.master.default_route_table_id}"}
output "vpc_default_network_acl_id"     {value = "${aws_vpc.master.default_network_acl_id}"}
output "vpc_default_security_group_id"  {value = "${aws_vpc.master.default_security_group_id}"}
output "vpc_instance_tenancy"           {value = "${aws_vpc.master.instance_tenancy}"}
output "vpc_enabled_classiclink"        {value = "${aws_vpc.master.enable_classiclink}"}
output "vpc_enabled_dns_support"        {value = "${aws_vpc.master.enable_dns_support}"}
output "vpc_enabled_dns_hostnames"      {value = "${aws_vpc.master.enable_dns_hostnames}"}
