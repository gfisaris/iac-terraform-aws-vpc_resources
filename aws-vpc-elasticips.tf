resource "aws_eip" "vpc_nat_gateway" {
  count = "${var.aws_vpc_enabled * var.aws_vpc_subnet_private_enabled}"
  vpc   = true
}

output "eip_id"         {value = "${aws_eip.vpc_nat_gateway.id}"}
output "eip_public_ip"  {value = "${aws_eip.vpc_nat_gateway.public_ip}"}
output "eip_private_ip" {value = "${aws_eip.vpc_nat_gateway.private_ip}"}
