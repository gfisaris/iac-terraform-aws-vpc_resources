resource "aws_eip" "ecs_cluster_vpc_nat_gateway" {
  count = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled}"
  vpc   = true
}

output "ecs_cluster_vpc_eip_id"         {value = "${aws_eip.ecs_cluster_vpc_nat_gateway.id}"}
output "ecs_cluster_vpc_eip_public_ip"  {value = "${aws_eip.ecs_cluster_vpc_nat_gateway.public_ip}"}
output "ecs_cluster_vpc_eip_private_ip" {value = "${aws_eip.ecs_cluster_vpc_nat_gateway.private_ip}"}
