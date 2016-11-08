resource "aws_eip" "nat" {
  vpc = true
}

output "NatGateway_ElasticIP_ID" {
  value = "${aws_eip.nat.id}"
}

output "NatGateway_ElasticIP_PublicIP" {
  value = "${aws_eip.nat.public_ip}"
}

output "NatGateway_ElasticIP_PrivateIP" {
  value = "${aws_eip.nat.private_ip}"
}

output "NatGateway_ElasticIP_InstanceID" {
  value = "${aws_eip.nat.instance}"
}

output "NatGateway_ElasticIP_NetworkInterfaceID" {
  value = "${aws_eip.nat.network_interface}"
}

output "NatGateway_ElasticIP_AssociatedPrivateIP" {
  value = "${aws_eip.nat.associate_with_private_ip}"
}
