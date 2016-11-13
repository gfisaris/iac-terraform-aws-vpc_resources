resource "aws_network_acl" "ecs_cluster_public" {
  count       = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_enabled}"
  vpc_id      = "${aws_vpc.ecs_cluster.id}"
  subnet_ids  = ["${aws_subnet.ecs_cluster_public.*.id}"]
}

output "ecs_cluster_public_vpc_network_acl_id" {value = "${aws_network_acl.ecs_cluster_public.id}"}

resource "aws_network_acl" "ecs_cluster_private" {
  count       = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled}"
  vpc_id      = "${aws_vpc.ecs_cluster.id}"
  subnet_ids  = ["${aws_subnet.ecs_cluster_private.*.id}"]
}

output "ecs_cluster_private_vpc_network_acl_id" {value = "${aws_network_acl.ecs_cluster_private.id}"}
