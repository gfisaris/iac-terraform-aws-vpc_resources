resource "aws_route" "ecs_cluster_internet_gateway" {
  count                   = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_enabled}"
  route_table_id          = "${aws_route_table.ecs_cluster_public.id}"
  gateway_id              = "${aws_internet_gateway.ecs_cluster.id}"
  destination_cidr_block  = "0.0.0.0/0"
}

resource "aws_route" "ecs_cluster_nat_gateway" {
  count                   = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled}"
  route_table_id          = "${aws_route_table.ecs_cluster_private.id}"
  gateway_id              = "${aws_nat_gateway.ecs_cluster.id}"
  destination_cidr_block  = "0.0.0.0/0"
}
