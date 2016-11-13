resource "aws_nat_gateway" "ecs_cluster" {
  count         = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled}"
  allocation_id = "${aws_eip.ecs_cluster_vpc_nat_gateway.id}"
  subnet_id     = "${aws_subnet.ecs_cluster_private.0.id}"

  depends_on = ["aws_internet_gateway.ecs_cluster", "aws_eip.ecs_cluster_vpc_nat_gateway"]
}

output "ecs_cluster_vpc_nat_gateway_id"                   {value = "${aws_nat_gateway.ecs_cluster.id}"}
output "ecs_cluster_vpc_nat_gateway_public_ip"            {value = "${aws_nat_gateway.ecs_cluster.public_ip}"}
output "ecs_cluster_vpc_nat_gateway_private_ip"           {value = "${aws_nat_gateway.ecs_cluster.private_ip}"}
output "ecs_cluster_vpc_nat_gateway_subnet_id"            {value = "${aws_nat_gateway.ecs_cluster.subnet_id}"}
output "ecs_cluster_vpc_nat_gateway_allocation_id"        {value = "${aws_nat_gateway.ecs_cluster.allocation_id}"}
output "ecs_cluster_vpc_nat_gateway_network_interface_id" {value = "${aws_nat_gateway.ecs_cluster.network_interface_id}"}
