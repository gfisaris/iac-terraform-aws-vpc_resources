resource "aws_security_group" "ec2_instances_ecs_cluster" {
  vpc_id      = "${aws_vpc.ecs_cluster.id}"

  name        = "ec2_instances_ecs_cluster"
  description = "VPC Security Group controlling access to ECS Cluster Host Container Instances"

  tags {
    Name          = "ec2_instances_ecs_cluster"
    Resource      = "instances"
    ResourceGroup = "ec2"
  }
}

output "security_group_ec2_instances_ecs_cluster_id"          {value = "${aws_security_group.ec2_instances_ecs_cluster.id}"}
output "security_group_ec2_instances_ecs_cluster_vpc_id"      {value = "${aws_security_group.ec2_instances_ecs_cluster.vpc_id}"}
output "security_group_ec2_instances_ecs_cluster_owner_id"    {value = "${aws_security_group.ec2_instances_ecs_cluster.owner_id}"}
output "security_group_ec2_instances_ecs_cluster_name"        {value = "${aws_security_group.ec2_instances_ecs_cluster.name}"}
output "security_group_ec2_instances_ecs_cluster_description" {value = "${aws_security_group.ec2_instances_ecs_cluster.description}"}


resource "aws_security_group" "ec2_alb_external_ecs_cluster" {
  vpc_id      = "${aws_vpc.ecs_cluster.id}"

  name        = "ec2_alb_external_ecs_cluster"
  description = "VPC Security Group controlling access to ECS Cluster External Elastic LoadBalancer"

  tags {
    Name          = "ec2_alb_external_ecs_cluster"
    Resource      = "alb"
    ResourceGroup = "ec2"
  }
}

output "security_group_ec2_alb_external_ecs_cluster_id"          {value = "${aws_security_group.ec2_alb_external_ecs_cluster.id}"}
output "security_group_ec2_alb_external_ecs_cluster_vpc_id"      {value = "${aws_security_group.ec2_alb_external_ecs_cluster.vpc_id}"}
output "security_group_ec2_alb_external_ecs_cluster_owner_id"    {value = "${aws_security_group.ec2_alb_external_ecs_cluster.owner_id}"}
output "security_group_ec2_alb_external_ecs_cluster_name"        {value = "${aws_security_group.ec2_alb_external_ecs_cluster.name}"}
output "security_group_ec2_alb_external_ecs_cluster_description" {value = "${aws_security_group.ec2_alb_external_ecs_cluster.description}"}


resource "aws_security_group" "ec2_alb_internal_ecs_cluster" {
  vpc_id      = "${aws_vpc.ecs_cluster.id}"

  name        = "ec2_alb_internal_ecs_cluster"
  description = "VPC Security Group controlling access to ECS Cluster Internal Elastic LoadBalancer"

  tags {
    Name          = "ec2_alb_internal_ecs_cluster"
    Resource      = "alb"
    ResourceGroup = "ec2"
  }
}

output "security_group_ec2_alb_internal_ecs_cluster_id"          {value = "${aws_security_group.ec2_alb_internal_ecs_cluster.id}"}
output "security_group_ec2_alb_internal_ecs_cluster_vpc_id"      {value = "${aws_security_group.ec2_alb_internal_ecs_cluster.vpc_id}"}
output "security_group_ec2_alb_internal_ecs_cluster_owner_id"    {value = "${aws_security_group.ec2_alb_internal_ecs_cluster.owner_id}"}
output "security_group_ec2_alb_internal_ecs_cluster_name"        {value = "${aws_security_group.ec2_alb_internal_ecs_cluster.name}"}
output "security_group_ec2_alb_internal_ecs_cluster_description" {value = "${aws_security_group.ec2_alb_internal_ecs_cluster.description}"}


resource "aws_security_group" "efs_ecs_cluster" {
  vpc_id      = "${aws_vpc.ecs_cluster.id}"

  name        = "efs_ecs_cluster"
  description = "VPC Security Group controlling access to ECS Cluster EFS Shares"

  tags {
    Name          = "efs_ecs_cluster"
    Resource      = "mounts"
    ResourceGroup = "efs"
  }
}

output "security_group_efs_ecs_cluster_id"          {value = "${aws_security_group.efs_ecs_cluster.id}"}
output "security_group_efs_ecs_cluster_vpc_id"      {value = "${aws_security_group.efs_ecs_cluster.vpc_id}"}
output "security_group_efs_ecs_cluster_owner_id"    {value = "${aws_security_group.efs_ecs_cluster.owner_id}"}
output "security_group_efs_ecs_cluster_name"        {value = "${aws_security_group.efs_ecs_cluster.name}"}
output "security_group_efs_ecs_cluster_description" {value = "${aws_security_group.efs_ecs_cluster.description}"}
