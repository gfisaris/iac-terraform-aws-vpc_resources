resource "aws_subnet" "ecs_cluster_public" {
  count             = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_count}"
  vpc_id            = "${aws_vpc.ecs_cluster_vpc_id}"
  cidr_block        = "${var.aws_vpc_subnet_ecs_cluster_public_cidr_block[count.index]}"
  availability_zone = "${data.aws_availability_zones.aws_region_az.names[count.index]}"

  map_public_ip_on_launch = "true"

  tags {
    Name              = "ecs_cluster_vpc_subnet_public"
    CIDR_Block        = "${var.aws_vpc_subnet_ecs_cluster_public_cidr_block[count.index]}"
    AZ                = "${data.aws_availability_zones.aws_region_az.names[count.index]}"
    VPC               = "${aws_vpc.ecs_cluster_vpc_id}"
    InternetAccess    = "true"
    awsResource       = "vpc"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_public_vpc_id" {value = ["${aws_subnet.ecs_cluster_public.*.vpc_id}"]}
output "ecs_cluster_public_vpc_subnet_id" {value = ["${aws_subnet.ecs_cluster_public.*.id}"]}
output "ecs_cluster_public_vpc_subnet_cidr_block" {value = ["${aws_subnet.ecs_cluster_public.*.cidr_block}"]}
output "ecs_cluster_public_vpc_subnet_availability_zone" {value = ["${aws_subnet.ecs_cluster_public.*.availability_zone}"]}


resource "aws_subnet" "ecs_cluster_private" {
  count             = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_count}"
  vpc_id            = "${aws_vpc.ecs_cluster_vpc_id}"
  cidr_block        = "${var.aws_vpc_subnet_ecs_cluster_private_cidr_block[count.index]}"
  availability_zone = "${data.aws_availability_zones.aws_region_az.names[count.index]}"

  tags {
    Name              = "ecs_cluster_vpc_subnet_private"
    CIDR_Block        = "${var.aws_vpc_subnet_ecs_cluster_private_cidr_block[count.index]}"
    AZ                = "${data.aws_availability_zones.aws_region_az.names[count.index]}"
    VPC               = "${aws_vpc.ecs_cluster_vpc_id}"
    InternetAccess    = "false"
    awsResource       = "vpc"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_private_vpc_id" {value = ["${aws_subnet.ecs_cluster_private.*.vpc_id}"]}
output "ecs_cluster_private_vpc_subnet_id" {value = ["${aws_subnet.ecs_cluster_private.*.id}"]}
output "ecs_cluster_private_vpc_subnet_cidr_block" {value = ["${aws_subnet.ecs_cluster_private.*.cidr_block}"]}
output "ecs_cluster_private_vpc_subnet_availability_zone" {value = ["${aws_subnet.ecs_cluster_private.*.availability_zone}"]}
