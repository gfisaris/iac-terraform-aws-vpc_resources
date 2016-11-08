resource "aws_internet_gateway" "master" {
  count   = "${var.aws_vpc_app_enabled}"
  vpc_id  = "${aws_vpc.app.id}"

  tags {
    Name          = "VPC-iGateway-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}"
    Resource      = "InternetGateway"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}
