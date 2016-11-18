resource "aws_subnet" "ecs_cluster_public" {
  count             = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_enabled * var.aws_vpc_subnet_ecs_cluster_public_count}"
  vpc_id            = "${aws_vpc.ecs_cluster.id}"
  cidr_block        = "${var.aws_vpc_subnet_ecs_cluster_public_cidr_block[count.index]}"
  availability_zone = "${data.terraform_remote_state.aws_dcs.availability_zones_state_available_names[count.index]}"

  map_public_ip_on_launch = "true"

  tags {
    Name              = "ecs_cluster_public_vpc_subnet-${count}"
    CIDR_Block        = "${var.aws_vpc_subnet_ecs_cluster_public_cidr_block[count.index]}"
    AZ                = "${data.terraform_remote_state.aws_dcs.availability_zones_state_available_names[count.index]}"
    VPC               = "${aws_vpc.ecs_cluster.id}"
    InternetAccess    = "direct"
    awsResource       = "vpc_subnets"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_vpc_subnet_public_id"                {value = ["${aws_subnet.ecs_cluster_public.*.id}"]}
output "ecs_cluster_vpc_subnet_public_vpc_id"            {value = ["${aws_subnet.ecs_cluster_public.*.vpc_id}"]}
output "ecs_cluster_vpc_subnet_public_cidr_block"        {value = ["${aws_subnet.ecs_cluster_public.*.cidr_block}"]}
output "ecs_cluster_vpc_subnet_public_availability_zone" {value = ["${aws_subnet.ecs_cluster_public.*.availability_zone}"]}


resource "aws_subnet" "ecs_cluster_private" {
  count             = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled * var.aws_vpc_subnet_ecs_cluster_private_count}"
  vpc_id            = "${aws_vpc.ecs_cluster.id}"
  cidr_block        = "${var.aws_vpc_subnet_ecs_cluster_private_cidr_block[count.index]}"
  availability_zone = "${data.terraform_remote_state.aws_dcs.availability_zones_state_available_names[count.index]}"

  tags {
    Name              = "ecs_cluster_private_vpc_subnet-${count}"
    CIDR_Block        = "${var.aws_vpc_subnet_ecs_cluster_private_cidr_block[count.index]}"
    AZ                = "${data.terraform_remote_state.aws_dcs.availability_zones_state_available_names[count.index]}"
    VPC               = "${aws_vpc.ecs_cluster.id}"
    InternetAccess    = "via_nat_gateway"
    awsResource       = "vpc"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_vpc_subnet_private_id"                {value = ["${aws_subnet.ecs_cluster_private.*.id}"]}
output "ecs_cluster_vpc_subnet_private_vpc_id"            {value = ["${aws_subnet.ecs_cluster_private.*.vpc_id}"]}
output "ecs_cluster_vpc_subnet_private_cidr_block"        {value = ["${aws_subnet.ecs_cluster_private.*.cidr_block}"]}
output "ecs_cluster_vpc_subnet_private_availability_zone" {value = ["${aws_subnet.ecs_cluster_private.*.availability_zone}"]}
