resource "aws_route_table" "ecs_cluster_public" {
  count   = "${var.aws_vpc_ecs_cluster_enabled}"
  vpc_id  = "${aws_vpc.ecs_cluster.id}"

  tags {
    Name              = "ecs_cluster_vpc_route_table_public"
    VPC               = "${aws_vpc.ecs_cluster_vpc_id}"
    InternetAccess    = "direct"
    awsResource       = "vpc_route_tables"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_public_vpc_id" {value = ["${aws_vpc.ecs_cluster.id}"]}
output "ecs_cluster_public_vpc_route_table_id" {value ="${aws_route_table.ecs_cluster_public.id}"}

resource "aws_route_table" "ecs_cluster_private" {
  count   = "${var.aws_vpc_ecs_cluster_enabled}"
  vpc_id  = "${aws_vpc.ecs_cluster.id}"

  tags {
    Name              = "ecs_cluster_vpc_route_table_private"
    VPC               = "${aws_vpc.ecs_cluster_vpc_id}"
    InternetAccess    = "via_nat_gateway"
    awsResource       = "vpc_route_tables"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_private_vpc_id" {value = ["${aws_vpc.ecs_cluster.id}"]}
output "ecs_cluster_private_vpc_route_table_id" {value ="${aws_route_table.ecs_cluster_private.id}"}
