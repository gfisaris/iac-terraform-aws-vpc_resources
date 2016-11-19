resource "aws_security_group" "ec2_instances" {
  vpc_id      = "${aws_vpc.master.id}"

  name        = "ec2_instances"
  description = "VPC Security Group controlling access to ECS Cluster Host Container Instances"

  tags {
    Name          = "ec2_instances"
    Resource      = "instances"
    ResourceGroup = "ec2"
  }
}

output "security_group_ec2_instances_id"          {value = "${aws_security_group.ec2_instances.id}"}
output "security_group_ec2_instances_vpc_id"      {value = "${aws_security_group.ec2_instances.vpc_id}"}
output "security_group_ec2_instances_owner_id"    {value = "${aws_security_group.ec2_instances.owner_id}"}
output "security_group_ec2_instances_name"        {value = "${aws_security_group.ec2_instances.name}"}
output "security_group_ec2_instances_description" {value = "${aws_security_group.ec2_instances.description}"}


resource "aws_security_group" "ec2_alb_external" {
  vpc_id      = "${aws_vpc.master.id}"

  name        = "ec2_alb_external"
  description = "VPC Security Group controlling access to ECS Cluster External Elastic LoadBalancer"

  tags {
    Name          = "ec2_alb_external"
    Resource      = "alb"
    ResourceGroup = "ec2"
  }
}

output "security_group_ec2_alb_external_id"          {value = "${aws_security_group.ec2_alb_external.id}"}
output "security_group_ec2_alb_external_vpc_id"      {value = "${aws_security_group.ec2_alb_external.vpc_id}"}
output "security_group_ec2_alb_external_owner_id"    {value = "${aws_security_group.ec2_alb_external.owner_id}"}
output "security_group_ec2_alb_external_name"        {value = "${aws_security_group.ec2_alb_external.name}"}
output "security_group_ec2_alb_external_description" {value = "${aws_security_group.ec2_alb_external.description}"}


resource "aws_security_group" "ec2_alb_internal" {
  vpc_id      = "${aws_vpc.master.id}"

  name        = "ec2_alb_internal"
  description = "VPC Security Group controlling access to ECS Cluster Internal Elastic LoadBalancer"

  tags {
    Name          = "ec2_alb_internal"
    Resource      = "alb"
    ResourceGroup = "ec2"
  }
}

output "security_group_ec2_alb_internal_id"          {value = "${aws_security_group.ec2_alb_internal.id}"}
output "security_group_ec2_alb_internal_vpc_id"      {value = "${aws_security_group.ec2_alb_internal.vpc_id}"}
output "security_group_ec2_alb_internal_owner_id"    {value = "${aws_security_group.ec2_alb_internal.owner_id}"}
output "security_group_ec2_alb_internal_name"        {value = "${aws_security_group.ec2_alb_internal.name}"}
output "security_group_ec2_alb_internal_description" {value = "${aws_security_group.ec2_alb_internal.description}"}


resource "aws_security_group" "efs" {
  vpc_id      = "${aws_vpc.master.id}"

  name        = "efs"
  description = "VPC Security Group controlling access to ECS Cluster EFS Shares"

  tags {
    Name          = "efs"
    Resource      = "mounts"
    ResourceGroup = "efs"
  }
}

output "security_group_efs_id"          {value = "${aws_security_group.efs.id}"}
output "security_group_efs_vpc_id"      {value = "${aws_security_group.efs.vpc_id}"}
output "security_group_efs_owner_id"    {value = "${aws_security_group.efs.owner_id}"}
output "security_group_efs_name"        {value = "${aws_security_group.efs.name}"}
output "security_group_efs_description" {value = "${aws_security_group.efs.description}"}
