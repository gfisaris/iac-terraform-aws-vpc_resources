resource "aws_nat_gateway" "master" {
  count         = "${var.aws_vpc_enabled * var.aws_vpc_subnet_private_enabled}"
  allocation_id = "${aws_eip.vpc_nat_gateway.id}"
  subnet_id     = "${aws_subnet.private.0.id}"

  depends_on = ["aws_internet_gateway.master", "aws_eip.vpc_nat_gateway"]
}

output "nat_gateway_id"                   {value = "${aws_nat_gateway.master.id}"}
output "nat_gateway_public_ip"            {value = "${aws_nat_gateway.master.public_ip}"}
output "nat_gateway_private_ip"           {value = "${aws_nat_gateway.master.private_ip}"}
output "nat_gateway_subnet_id"            {value = "${aws_nat_gateway.master.subnet_id}"}
output "nat_gateway_allocation_id"        {value = "${aws_nat_gateway.master.allocation_id}"}
output "nat_gateway_network_interface_id" {value = "${aws_nat_gateway.master.network_interface_id}"}
