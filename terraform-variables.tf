##  Project's Information  ##

  variable "project_name" {
    description = "Name of the Project for which the Infrastructure is about | (Example: GEMv2.GLM.app || HTTP || PROD)"
  }
/*
  variable "project_gitrepo_url" {
    description = "The URL Of Project Git Repository"
  }

  variable "project_gitrepo_branch" {
    description = "The Branch Of Project Git Repository"
  }

  variable "project_gitrepo_uname" {
    description = "The Branch Of Project Git Repository"
  }

  variable "project_gitrepo_upass" {
    description = "The Branch Of Project Git Repository"
  }

  variable "project_gitrepo_ssh_keypair_private" {
    description = "SSH Private Key that will be used to access Project GitHub Repo (Example: ssh-rsa AAABBBCCC999... email@example.com)"
  }
*/
  variable "prj_ecosystem" {
    description = "Name of the Ecosystem, the Web Application is part of | [Valid Values: gemv1 / gemv2]"
  }

  variable "prj_application" {
    description = "Name of the Web Application | (Example: glm-app) | Alphanumeric characters, hyphens (-), and underscores (_) are allowed."
  }
/*
  variable "prj_interface" {
    description = "Which interface will the Web Application be used through | [Valid Values: http / cli]"
  }
*/
  variable "prj_environment" {
    description = "On which Environment will the Web Application be launched | [Valid Values: prod | beta | stg]"
  }

/*
##  Management Tools  ##

  ## CodeDeploy ##
  variable "clf_codedeploy_apprev_gitrepo" {
    default     = "gfisaris/aws-codedeploy-app-revision"
    description = "AWS CloudFormation | CodeDeploy | Application Revision | Git Repository"
  }

  variable "clf_codedeploy_apprev_commitid" {
    description = "AWS CloudFormation | CodeDeploy | Application Revision | Commit ID"
  }
*/

##  VPC Resources  ##

  ##  VPC  ##
    variable "aws_vpc_app_enabled" {
      default     = "1"
      description = "Create a VPC? IF {YES} then SET this Value to 1"
      }

    variable "aws_vpc_app_cidr_block" {
      default     = "192.168.0.0/21"
      description = "Internal IP Range of the Public VPC (Example: 192.168.0.0/22)"
      }

    variable "aws_vpc_app_enable_dns_support" {
      default     = "true"
      description = "A boolean flag to enable/disable DNS support in the VPC | true OR false"
      }

    variable "aws_vpc_app_enable_dns_hostnames" {
      default     = "true"
      description = "A boolean flag to enable/disable DNS Hostnames support in the VPC | true OR false"
      }

    variable "aws_vpc_app_enable_classiclink" {
      default     = "false"
      description = "A boolean flag to enable/disable ClassicLink support in the VPC | true OR false"
      }



##  VPC - Subnets  ##
  variable "aws_vpc_subnets_pub_count" {
    default = "2"
    }

  variable "aws_vpc_subnets_prv_count" {
    default = "2"
    }

  ##  Public VPC Subnets  ##
    variable "aws_vpc_subnet_pub_cidr_block" {
      default     = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
      description = "Internal IP Range of the Public VPC Subnet 01 (Example: 192.168.1.0/24)"
      }
  
  ##  Private VPC Subnets  ##
    variable "aws_vpc_subnet_prv_cidr_block" {
      default     = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
      description = "IP Ranges of the Private VPC Subnets"
      }


/*
##  Route 53  ##

  # Create a Public Domain (Zone)?
  # IF YES set Value = 1
  variable "aws_r53_zone_pub" {
    default = 0
    description = "Create a Public Domain (Zone)? IF {YES} then the Value MUST be set = 1"
  }

    # Name of the Domain (Zone)
    variable "aws_r53_zone_pub_name" {
      default = "noname.tld"
      description = "Please provide then Name of the Public Domain (Zone)"
    }

    # A Comment for the Public Domain (Zone)
    variable "aws_r53_zone_pub_comment" {
      default = "NoName.tld is just a placeholder.."
      description = "Please provide a comment (small description) about the Public Domain (Zone)"
    }

  # Create a Private Domain (Zone)?
  # IF YES set Value = 1
  variable "aws_r53_zone_prv" {
    default = 0
    description = "Create a Private Domain (Zone)? IF {YES} then the Value MUST be set = 1"
  }

    # Name of the Private Domain (Zone)
    variable "aws_r53_zone_prv_name" {
      default = "noname.tld"
      description = "Please provide then Name of the Private Domain (Zone)"
    }

    # A Comment for the Private Domain (Zone)
    variable "aws_r53_zone_prv_comment" {
      default = "NoName.tld is just a placeholder.."
      description = "Please provide a comment (small description) about the Private Domain (Zone)"
    }



##  Enable/Disable AWS Services  ##

  # AWS RDS - MariaDB Cluster
  variable "aws_rds_cluster_mariadb_enabled" {
    default = 0
  }

  # AWS ElasticSearch Cluster
  variable "aws_elasticsearch_cluster_enabled" {
    default = 0
  }

  # AWS ElastiCache - Redis Cluster
  variable "aws_elasticache_cluster_redis_enabled" {
    default = 0
  }

  # AWS ElastiCache - Memcached Cluster
  variable "aws_elasticache_cluster_memcached_enabled" {
    default = 0
  }

  # AWS EFS
  variable "aws_efs_cluster_enabled" {
    default = 0
  }
*/
  
##  AWS Account Information  ##

  variable "aws_access_key" {
    decscription = "AWS Access Key"
  }
  
  variable "aws_secret_key" {
    description = "AWS Secret Key"
  }
  
  variable "aws_region" {
    description = "Which AWS Region will be used ?"
    default = "eu-west-1"
  }

/*  
#  EC2 | Instances Parameters  ##

  variable "ec2_instance_type" {
    default = "t2.micro"
    description = "The type of the EC2 Instances"
  }


##  EC2 | Network & Security Parameters  ##

  variable "ssh_keypair_public" {
    description = "SSH Public Key that will be used to access the EC2 Instances (Example: ssh-rsa AAABBBCCC999... email@example.com)"
  }


##  EC2 | Auto Scaling Parameters  ##

  variable "asg_min_instances" {
    default = 0
    description = "The minimum number of Instances available on any given point of time"
  }
  
  variable "asg_max_instances" {
    default = 0
    description = "The maximum number of Instances available on any given point of time"
  }
  
  variable "asg_des_instances" {
    default = 0
    description = "The desire number of Instances available on any given point of time"
  }

##### Others..  #####

  variable "ec2_instance-root_volume_size" {
    default = 10
    description = "Size (in GB) of the Root Volume for the EC2 Instances"
  }

  variable "project_db_name" {
    default = "db_name"
    description = "Name of the Project's main Database that will be created on the RDS Instance"
  }

  variable "project_db_admin_username" {
    default = "db_admin"
    description = "Username of the RDS Instance Administrator"
  }

  variable "project_db_admin_password" {
    default = "db_admin_pass"
    description = "Password of the RDS Instance Administrator"
  }

*/
