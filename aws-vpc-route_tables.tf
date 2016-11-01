resource "aws_route_table" "public" {
  count = "${var.aws_vpc_app_enabled}"
  
  vpc_id = "${aws_vpc.app.id}"
  
  tags {
    Name          = "VPC-RouteTbl-PUB-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Resource      = "RouteTables"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
	}
}

resource "aws_route_table" "private" {
  count = "${var.aws_vpc_app_enabled}"

  vpc_id = "${aws_vpc.app.id}"

  tags {
    Name          = "VPC-RouteTbl-PRV-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Resource      = "RouteTables"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}
