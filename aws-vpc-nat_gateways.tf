resource "aws_nat_gateway" "master" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public.0.id}"

  depends_on = ["aws_internet_gateway.master", "aws_eip.nat"]
}

output "NatGatewayID" {
  value = "${aws_nat_gateway.master.id}"
}
output "NatGateway_AllocationID" {
  value = "${aws_nat_gateway.master.allocation_id}"
}
output "NatGateway_SubnetID" {
  value = "${aws_nat_gateway.master.subnet_id}"
}
output "NatGateway_NetworkInterfaceID" {
  value = "${aws_nat_gateway.master.network_interface_id}"
}
output "NatGateway_PrivateIP" {
  value = "${aws_nat_gateway.master.private_ip}"
}
output "NatGateway_PublicIP" {
  value = "${aws_nat_gateway.master.public_ip}"
}
