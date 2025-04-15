module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  #source  = "terraform-aws-modules/vpc/aws" 5.1.2
  version = "5.1.2"
  name    = "Formacao_AWS-vpc"
  cidr    = "10.20.0.0/16"

  azs              = ["us-east-1a", "us-east-1b"]
  private_subnets  = ["10.20.201.0/24", "10.20.202.0/24"]
  public_subnets   = ["10.20.101.0/24", "10.20.102.0/24"]
  database_subnets = ["10.20.21.0/24", "10.20.22.0/24"]
  #assign_generated_ipv6_cidr_block = true
  create_database_subnet_group       = true # var.create_database_subnet_group
  create_database_subnet_route_table = true # var.create_database_subnet_route_table
  create_igw                         = true
  #lifecycle {
  #  prevent_destroy = true
  #}

  enable_dns_hostnames   = true
  enable_nat_gateway     = false
  single_nat_gateway     = false
  enable_vpn_gateway     = false
  one_nat_gateway_per_az = false
  ##reuse_nat_ips = true
  #external_nat_ip_ids = "${aws_eip.nat.*.id}"
  ##manage_default_network_acl = true

  public_subnet_tags = {
    Name = "SubNet-public"
  }

  private_subnet_tags = {
    Name = "SubNet-privada"
  }

  database_subnet_tags = {
    Name = "SubNet-DataBase"
  }

  tags = {
    Terraform   = "true"
    Environment = "Projeto-${var.environment}"
    Management  = "Terraform"
  }
}



