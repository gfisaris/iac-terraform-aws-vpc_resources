resource "aws_subnet" "public" {
  count             = "${var.aws_vpc_enabled * var.aws_vpc_subnet_public_enabled * var.aws_vpc_subnet_public_count}"
  vpc_id            = "${aws_vpc.master.id}"
  cidr_block        = "${var.aws_vpc_subnet_public_cidr_block[count.index]}"
  availability_zone = "${data.terraform_remote_state.aws_ds.availability_zones_state_available_names[count.index]}"

  map_public_ip_on_launch = "true"

  tags {
    Name              = "public_vpc_subnet-${count}"
    CIDR_Block        = "${var.aws_vpc_subnet_public_cidr_block[count.index]}"
    AZ                = "${data.terraform_remote_state.aws_ds.availability_zones_state_available_names[count.index]}"
    VPC               = "${aws_vpc.master.id}"
    InternetAccess    = "direct"
    awsResource       = "vpc_subnets"
    awsResourceGroup  = "vpc-networking"
  }
}

output "subnet_public_count" { value = "${length(split(",", "${join(",", aws_subnet.public.*.id)}"))}  " }

output "subnet_public_id"                {value = ["${aws_subnet.public.*.id}"]}
output "subnet_public_vpc_id"            {value = ["${aws_subnet.public.*.vpc_id}"]}
output "subnet_public_cidr_block"        {value = ["${aws_subnet.public.*.cidr_block}"]}
output "subnet_public_availability_zone" {value = ["${aws_subnet.public.*.availability_zone}"]}


resource "aws_subnet" "private" {
  count             = "${var.aws_vpc_enabled * var.aws_vpc_subnet_private_enabled * var.aws_vpc_subnet_private_count}"
  vpc_id            = "${aws_vpc.master.id}"
  cidr_block        = "${var.aws_vpc_subnet_private_cidr_block[count.index]}"
  availability_zone = "${data.terraform_remote_state.aws_ds.availability_zones_state_available_names[count.index]}"

  tags {
    Name              = "private_vpc_subnet-${count}"
    CIDR_Block        = "${var.aws_vpc_subnet_private_cidr_block[count.index]}"
    AZ                = "${data.terraform_remote_state.aws_ds.availability_zones_state_available_names[count.index]}"
    VPC               = "${aws_vpc.master.id}"
    InternetAccess    = "via_nat_gateway"
    awsResource       = "vpc"
    awsResourceGroup  = "vpc-networking"
  }
}

output "subnet_private_count" { value = "${length(split(",", "${join(",", aws_subnet.private.*.id)}"))}  " }

output "subnet_private_id"                {value = ["${aws_subnet.private.*.id}"]}
output "subnet_private_vpc_id"            {value = ["${aws_subnet.private.*.vpc_id}"]}
output "subnet_private_cidr_block"        {value = ["${aws_subnet.private.*.cidr_block}"]}
output "subnet_private_availability_zone" {value = ["${aws_subnet.private.*.availability_zone}"]}
