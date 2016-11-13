resource "aws_internet_gateway" "ecs_cluster" {
  count   = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_enabled}"
  vpc_id  = "${aws_vpc.ecs_cluster.id}"

  tags {
    Name              = "ecs_cluster_vpc_internet_gateway"
    VPC               = "${aws_vpc.ecs_cluster.id}"
    awsResource       = "vpc_internet_gateways"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_vpc_internet_gateway_id" {value = "${aws_internet_gateway.ecs_cluster.id}"}
