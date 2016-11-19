##  AWS VPC Resources  ##

  ## VPC
  variable "aws_vpc_enabled"              {description = "Create a VPC                      (0 = False / 1 = True)"}
  variable "aws_vpc_enable_classiclink"   {description = "VPC Enable ClassicLink Support    (0 = False / 1 = True)"}
  variable "aws_vpc_enable_dns_support"   {description = "VPC Enable DNS Support            (0 = False / 1 = True)"}
  variable "aws_vpc_enable_dns_hostnames" {description = "VPC Enable DNS Hostnames Support  (0 = False / 1 = True)"}

  variable "aws_vpc_cidr_block" {
    type="string"
    description = "VPC Internal IP Range (Example: 192.168.0.0/20)"
  }

  ## VPC - Subnets

    # Public Subnets
    variable "aws_vpc_subnet_public_enabled"  {description = "Create Public VPC Subnets            (0 = False / 1 = True)                             "}
    variable "aws_vpc_subnet_public_count"    {description = "Public VPC Subnets Count             (Example: 3 (For AWS Region: Ireland | eu-west-1)) "}

    variable "aws_vpc_subnet_public_cidr_block" {
      type="list"
      description = "Public VPC Subnets Internal IP Range (Example:\"192.168.1.0/24\", \"192.168.2.0/24\", \"192.168.3.0/24\")"
    }

    # Private Subnets
    variable "aws_vpc_subnet_private_enabled" {description = "Create Private VPC Subnets            (0 = False / 1 = True)"}
    variable "aws_vpc_subnet_private_count"   {description = "Private VPC Subnets Count             (Example: 3 (For AWS Region: Ireland | eu-west-1))"}

    variable "aws_vpc_subnet_private_cidr_block" {
      type="list"
      description = "Private VPC Subnets Internal IP Range (Example:\"192.168.4.0/24\", \"192.168.5.0/24\", \"192.168.6.0/24\")"
    }
