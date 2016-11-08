resource "aws_subnet" "public" {
  count             = "${var.aws_vpc_subnets_pub_count * var.aws_vpc_app_enabled}"
  vpc_id            = "${aws_vpc.app.id}"
  cidr_block        = "${var.aws_vpc_subnet_pub_cidr_block[count.index]}"
  availability_zone = "${data.aws_availability_zones.aws_account_az.names[count.index]}"
    
  map_public_ip_on_launch = "true"
  
  tags {
    Name          = "VPC-Subnet-Public-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-${count.index}"
    AZ            = "${data.aws_availability_zones.aws_account_az.names[count.index]}"
    Access        = "Public"
    Resource      = "Subnets"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}

resource "aws_subnet" "private" {
  count             = "${var.aws_vpc_subnets_prv_count * var.aws_vpc_app_enabled}"
  vpc_id            = "${aws_vpc.app.id}"
  cidr_block        = "${var.aws_vpc_subnet_prv_cidr_block[count.index]}"
  availability_zone = "${data.aws_availability_zones.aws_account_az.names[count.index]}"
  
  tags {
    Name          = "VPC-Subnet-Private-${var.prj_environment}-${var.prj_ecosystem}-${var.prj_application}-${count.index}"
    AZ            = "${data.aws_availability_zones.aws_account_az.names[count.index]}"
    Access        = "Private"
    Resource      = "Subnets"
    ResourceGroup = "VPC"
    Ecosystem     = "${var.prj_ecosystem}"
    Application   = "${var.prj_application}"
    Environment   = "${var.prj_environment}"
  }
}



output "vpc_subnets_public" {
  value = ["${aws_subnet.public.*.id}"]
}

output "number_of_public_subnets" {
  value = "${aws_subnet.public.count}"
}

output "vpc_subnets_private" {
  value = ["${aws_subnet.private.*.id}"]
}
