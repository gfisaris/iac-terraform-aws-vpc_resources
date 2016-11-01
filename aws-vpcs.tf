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
