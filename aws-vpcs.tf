resource "aws_vpc" "app" {
  count                 = "${var.aws_vpc_app_enabled}"
  cidr_block            = "${var.aws_vpc_app_cidr_block}"
  enable_classiclink    = "${var.aws_vpc_app_enable_classiclink}"
  enable_dns_support    = "${var.aws_vpc_app_enable_dns_support}"
  enable_dns_hostnames  = "${var.aws_vpc_app_enable_dns_hostnames}"
  
  tags {
    Name          = "VPC-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Resource      = "VPC"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}
  output "MasterVPC-ID" {
    value = "${aws_vpc.app.id}"
  }

  output "MasterVPC_cidrBlock" {
    value = "${aws_vpc.app.cidr_block}"
  }

  output "MasterVPC_mainRouteTableID" {
    value = "${aws_vpc.app.main_route_table_id}"
  }

  output "MasterVPC_defaultRouteTableID" {
    value = "${aws_vpc.app.default_route_table_id}"
  }

  output "MasterVPC_defaultNetworkACLID" {
    value = "${aws_vpc.app.default_network_acl_id}"
  }

  output "MasterVPC_defaultSecurityGroupID" {
    value = "${aws_vpc.app.default_security_group_id}"
  }

  output "MasterVPC_enabled_DNS_Support" {
    value = "${aws_vpc.app.enable_dns_support}"
  }
  
  output "MasterVPC_enabled_DNS_Hostnames" {
    value = "${aws_vpc.app.enable_dns_hostnames}"
  }

  output "MasterVPC_enabled_ClassicLink" {
    value = "${aws_vpc.app.enable_classiclink}"
  }

  output "MasterVPC_InstanceTenancy" {
    value = "${aws_vpc.app.instance_tenancy}"
  }


