resource "aws_route_table_association" "ecs_cluster_public" {
  count           = "${var.aws_vpc_subnet_ecs_cluster_public_count * var.aws_vpc_subnet_ecs_cluster_public_enabled * var.aws_vpc_ecs_cluster_enabled}"
  subnet_id       = "${element(aws_subnet.ecs_cluster_public.*.id, count.index)}"
  route_table_id  = "${aws_route_table.ecs_cluster_public.id}"
}

resource "aws_route_table_association" "ecs_cluster_private" {
  count           = "${var.aws_vpc_subnet_ecs_cluster_private_count * var.aws_vpc_subnet_ecs_cluster_private_enabled * var.aws_vpc_ecs_cluster_enabled}"
  subnet_id       = "${element(aws_subnet.ecs_cluster_private.*.id, count.index)}"
  route_table_id  = "${aws_route_table.ecs_cluster_private.id}"
}
