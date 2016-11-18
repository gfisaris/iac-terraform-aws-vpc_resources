// ECS Cluster - EC2 Instances | Security Group Rules

resource "aws_security_group_rule" "ec2_instances_ecs_cluster_ingress_http_80" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "80"
  to_port     = "80"
  security_group_id         = "${aws_security_group.ec2_instances_ecs_cluster.id}"
  source_security_group_id  = "${aws_security_group.ec2_alb_external_ecs_cluster.id}"
}

resource "aws_security_group_rule" "ec2_instances_ecs_cluster_egress_allports" {
  type        = "egress"
  protocol    = "tcp"
  from_port   = "0"
  to_port     = "65535"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec2_instances_ecs_cluster.id}"
}

// ECS Cluster - EC2 Application LoadBalancers | Security Group Rules

resource "aws_security_group_rule" "ec2_alb_external_ecs_cluster_ingress_http_80" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "80"
  to_port     = "80"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec2_alb_external_ecs_cluster.id}"
}

resource "aws_security_group_rule" "ec2_alb_external_ecs_cluster_egress_allports" {
  type        = "egress"
  protocol    = "tcp"
  from_port   = "0"
  to_port     = "65535"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id	= "${aws_security_group.ec2_alb_external_ecs_cluster.id}"
}

resource "aws_security_group_rule" "ec2_alb_internal_ecs_cluster_ingress_http_80" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "80"
  to_port     = "80"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ec2_alb_internal_ecs_cluster.id}"
}

resource "aws_security_group_rule" "ec2_alb_internal_ecs_cluster_egress_allports" {
  type        = "egress"
  protocol    = "tcp"
  from_port   = "0"
  to_port     = "65535"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id	= "${aws_security_group.ec2_alb_internal_ecs_cluster.id}"
}

// ECS Cluster - EFS Shares | Security Group Rules

resource "aws_security_group_rule" "efs_ecs_cluster_ingress_nfs_2049" {
  type        = "ingress"
  protocol    = "tcp"
  from_port   = "2049"
  to_port     = "2049"
  security_group_id         = "${aws_security_group.efs_ecs_cluster.id}"
  source_security_group_id  = "${aws_security_group.ec2_instances_ecs_cluster.id}"
}

resource "aws_security_group_rule" "efs_ecs_cluster_egress_nfs_2049" {
  type        = "egress"
  protocol    = "tcp"
  from_port   = "2049"
  to_port     = "2049"
  security_group_id         = "${aws_security_group.efs_ecs_cluster.id}"
  source_security_group_id  = "${aws_security_group.ec2_instances_ecs_cluster.id}"
}
