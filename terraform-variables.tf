##  AWS Account Information  ##

  variable "tf_provider_aws_region"     {description  = "AWS Region     "}
  variable "tf_provider_aws_access_key" {decscription = "AWS Access Key "}
  variable "tf_provider_aws_secret_key" {description  = "AWS Secret Key "}


##  AWV VPC Resources  ##

  ## ECS Cluster VPC
  variable "aws_vpc_ecs_cluster_enabled"              {description = "Create a VPC for ECS Cluster                  (0 = False / 1 = True)    "}
  variable "aws_vpc_ecs_cluster_cidr_block"           {description = "ECS Cluster VPC Internal IP Range             (Example: 192.168.0.0/20) "}
  variable "aws_vpc_ecs_cluster_enable_classiclink"   {description = "ECS Cluster VPC Enable ClassicLink Support    (0 = False / 1 = True)    "}
  variable "aws_vpc_ecs_cluster_enable_dns_support"   {description = "ECS Cluster VPC Enable DNS Support            (0 = False / 1 = True)    "}
  variable "aws_vpc_ecs_cluster_enable_dns_hostnames" {description = "ECS Cluster VPC Enable DNS Hostnames Support  (0 = False / 1 = True)    "}

  ## ECS Cluster VPC - Subnets

    # Public Subnets
    variable "aws_vpc_subnet_ecs_cluster_public_enabled"      {description = "Create Public VPC Subnets for ECS Cluster        (0 = False / 1 = True)                                               "}
    variable "aws_vpc_subnet_ecs_cluster_public_count"        {description = "ECS Cluster Public VPC Subnets Count             (Example: 3 (For AWS Region: Ireland | eu-west-1))                   "}
    variable "aws_vpc_subnet_ecs_cluster_public_cidr_block"   {description = "ECS Cluster Public VPC Subnets Internal IP Range (Example:\"192.168.1.0/24\", \"192.168.2.0/24\", \"192.168.3.0/24\") "}

    # Private Subnets
    variable "aws_vpc_subnet_ecs_cluster_private_enabled"     {description = "Create Private VPC Subnets for ECS Cluster        (0 = False / 1 = True)"}
    variable "aws_vpc_subnet_ecs_cluster_private_count"       {description = "ECS Cluster Private VPC Subnets Count             (Example: 3 (For AWS Region: Ireland | eu-west-1))                   "}
    variable "aws_vpc_subnet_ecs_cluster_private_cidr_block"  {description = "ECS Cluster Private VPC Subnets Internal IP Range (Example:\"192.168.4.0/24\", \"192.168.5.0/24\", \"192.168.6.0/24\") "}
