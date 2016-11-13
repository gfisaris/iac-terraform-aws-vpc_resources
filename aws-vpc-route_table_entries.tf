resource "aws_route" "internet_gateway" {
  count                   = "${var.aws_vpc_ecs_cluster_enabled}"
  route_table_id          = "${aws_route_table.ecs_cluster_public.id}"
  gateway_id              = "${aws_internet_gateway.ecs_cluster_vpc.id}"
  destination_cidr_block  = "0.0.0.0/0"
}

resource "aws_route" "nat_gateway" {
  count                   = "${var.aws_vpc_ecs_cluster_enabled}"
  route_table_id          = "${aws_route_table.ecs_cluster_private.id}"
  gateway_id              = "${aws_nat_gateway.ecs_cluster_vpc.id}"
  destination_cidr_block  = "0.0.0.0/0"
}
