
resource "aws_security_group" "bia-dev" {
  name        = "bia-dev"
  description = "bia-dev"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_HTTP Porta 3001"
  }

}

resource "aws_security_group" "bia-dev-mssql" {
  name        = "bia-dev-mssql"
  description = "bia-dev-mssql"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  #ingress {
  #  from_port   = 1433
  #  to_port     = 1433
  #  protocol    = "TCP"
  #  cidr_blocks = ["0.0.0.0/0"]
  #}

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_MS_SQL Porta 1433"
  }

}

resource "aws_security_group" "bia-web" {
  name        = "bia-web"
  description = "bia-web"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_HTTP Porta 80 e 443"
  }

}

resource "aws_security_group" "bia-db" {
  name        = "bia-db"
  description = "bia-db"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "TCP"
    security_groups = [
      aws_security_group.bia-web.id,
      aws_security_group.bia-ec2.id,
      aws_security_group.bia-dev-mssql.id,
      aws_security_group.bia-dev.id
    ]
  }

  ingress {
    from_port = 1433
    to_port   = 1433
    protocol  = "TCP"
    security_groups = [
      #aws_security_group.bia-web.id,
      #aws_security_group.bia-ec2.id,
      aws_security_group.bia-dev.id,
      aws_security_group.bia-dev-mssql.id
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_RDS"
  }

}

resource "aws_security_group" "mssql-db" {
  name        = "mssql-db"
  description = "mssql-db"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port = 1433
    to_port   = 1433
    protocol  = "TCP"
    security_groups = [
      #aws_security_group.bia-web.id,
      #aws_security_group.bia-ec2.id,
      aws_security_group.bia-dev.id,
      aws_security_group.bia-dev-mssql.id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_PostGres Porta 1433"
  }

}

resource "aws_security_group" "bia-alb" {
  name        = "bia-alb"
  description = "bia-alb"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "TCP"
    #security_groups = [
    #  aws_security_group.bia-web.id,
    #  aws_security_group.bia-dev.id
    #]
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "TCP"
    #security_groups = [
    #  aws_security_group.bia-web.id,
    #  aws_security_group.bia-dev.id
    #]
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_ALB Porta 80 e 443"
  }

}

resource "aws_security_group" "bia-ec2" {
  name        = "bia-ec2"
  description = "bia-ec2"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "TCP"
    security_groups = [
      aws_security_group.bia-alb.id
    ]
    #cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_ECS - EC2"
  }

}


/*
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  #data.terraform_remote_state.vpc.outputs.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = var.cdirs_acesso_remoto
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_SSH"
  }

}

resource "aws_security_group" "acesso-http" {
  name        = "acesso-http"
  description = "acesso-http"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_HTTP"
  }

}

resource "aws_security_group" "acesso-https" {
  name        = "acesso-https"
  description = "acesso-https"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_HTTPS"
  }

}

resource "aws_security_group" "alb" {
  name        = "acesso-alb"
  description = "acesso-alb"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = aws_security_group.acesso-alb
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = aws_security_group.acesso-alb
  }
}

# ECS

resource "aws_security_group" "acesso-ecs" {
  name        = "acesso-ecs"
  description = "acesso-ecs"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  #vpc_id      = module.vpc_private_subnets

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = ["aws_security_group.acesso-alb"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = ["aws_security_group.acesso-alb"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #security_groups = ["aws_security_group.acesso-alb"]
  }
}

# --- ECS Node SG ---

resource "aws_security_group" "ecs_node_sg" {
  name_prefix = "projeto20-ecs-node-sg-"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "acesso-rds" {
  name        = "acesso-rds"
  description = "acesso-rds"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  ingress {
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_RDS"
  }
}

resource "aws_security_group" "ecs_task" {
  name_prefix = "ecs-task-sg-"
  description = "Allow all traffic within the VPC"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb.id]
    #cidr_blocks = [module.vpc.default_vpc_cidr_block]
    #[aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http" {
  name_prefix = "http-sg-"
  description = "Allow all HTTP/HTTPS traffic from public"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  #module.vpc.Projeto_20-vpc.vpc_id
  #aws_vpc.main.id

  dynamic "ingress" {
    for_each = [80, 443]
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "efs_sg" {
  name        = "acesso-efs"
  description = "acesso-efs"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    #var.cdirs_acesso_remoto
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_EFS"
  }


}

resource "aws_security_group" "ecs_service_rule" {
  name        = "sg_ecs_service_rule"
  description = "Security Group ECS Rule"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    #var.cdirs_acesso_remoto
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    #var.cdirs_acesso_remoto
  }
  egress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Acesso_ECS_Rule"
  }
}

*/