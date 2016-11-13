resource "aws_route_table" "ecs_cluster_public" {
  count   = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_public_enabled}"
  vpc_id  = "${aws_vpc.ecs_cluster.id}"

  tags {
    Name              = "ecs_cluster_public_vpc_route_table"
    VPC               = "${aws_vpc.ecs_cluster.id}"
    InternetAccess    = "direct"
    awsResource       = "vpc_route_tables"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_public_vpc_route_table_id"      {value = "${aws_route_table.ecs_cluster_public.id}"}
output "ecs_cluster_public_vpc_route_table_vpc_id"  {value = "${aws_vpc.ecs_cluster.id}"}

resource "aws_route_table" "ecs_cluster_private" {
  count   = "${var.aws_vpc_ecs_cluster_enabled * var.aws_vpc_subnet_ecs_cluster_private_enabled}"
  vpc_id  = "${aws_vpc.ecs_cluster.id}"

  tags {
    Name              = "ecs_cluster_private_vpc_route_table"
    VPC               = "${aws_vpc.ecs_cluster.id}"
    InternetAccess    = "via_nat_gateway"
    awsResource       = "vpc_route_tables"
    awsResourceGroup  = "vpc-networking"
  }
}

output "ecs_cluster_private_vpc_route_table_id"     {value = "${aws_route_table.ecs_cluster_private.id}"}
output "ecs_cluster_private_vpc_route_table_vpc_id" {value = "${aws_vpc.ecs_cluster.id}"}
