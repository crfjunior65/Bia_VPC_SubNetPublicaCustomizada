#output "Srv-0" {
#  value = aws_instance.app_server[0].public_ip
#}

#output "Srv-5" {
#  value = aws_instance.app_server6.public_ip 
#}

#output "vpc_public_subnets" {
#  description = "IDs of the VPC's public subnets"
#  value       = module.vpc.public_subnets
#}

#output "vpc_private_subnets" {
#  description = "IDs of the VPC's private subnets"
#  value       = module.vpc.private_subnets
#}

#output "EndPoint_DB" {
#  description = "End Point DB"
#  value       = aws_db_instance.db-Projeto20.endpoint
#}

#output "load_balancer_dns" {
#  value = aws_lb.main.dns_name
#  #aws_lb.projeto14.dns_name
#}


#output "AMI-Ubuntu" {
#  description = "AMI-Ubuntu"
#  value       = data.aws_ami_ids.ubuntu-ami
#}

#output "AMI-AmazonLinux" {
#  description = "AMI-Ubuntu"
#  value       = data.aws_ami_ids.amzn-linux-2023-ami
#}

#output "rendered_policy" {
#  value = aws_iam_role_policy_attachment.ecs_node_role_policy
#}

###

output "regiao" {
  description = "Região onde a infraestrutura será criada."
  value       = var.regiao
}

output "projeto" {
  description = "Descrição do projeto."
  value       = var.projeto
}

output "cliente" {
  description = "Cliente do projeto."
  value       = var.cliente
}

output "autor" {
  description = "Autor de edição."
  value       = var.autor
}

output "shortnameid" {
  description = "Nome curto para identificação dos recursos na AWS"
  value       = var.shortnameid
}

#Bia DEV
#/*
output "EC2_bia_dev_sg_ids" {
  description = "Ids dos SGs"
  value       = aws_instance.ec2_bia_dev.vpc_security_group_ids
}

output "public_ip" {
  value = aws_instance.ec2_bia_dev.public_ip
}

output "private_ip" {
  value = aws_instance.ec2_bia_dev.private_ip
}


output "id_instancia" {
  value = aws_instance.ec2_bia_dev.id
}

#*/

#Bia Porteiro
/*
output "EC2_bia_dev_sg_ids" {
  description = "Ids dos SGs"
  value       = aws_instance.ec2_bia_porteiro.vpc_security_group_ids
}

output "public_ip" {
  value = aws_instance.ec2_bia_porteiro.public_ip
}

output "private_ip" {
  value = aws_instance.ec2_bia_porteiro.private_ip
}


output "id_instancia" {
  value = aws_instance.ec2_bia_porteiro.id
}

*/

output "ami_ubuntu_2204" {
  value = data.aws_ami.ubuntu_linux_2204
}

output "ami_ubuntu" {
  value = data.aws_ami.ubuntu_linux
}

output "ami_amazon" {
  value = data.aws_ami.amazon_linux
}

output "ami_amazon_2023" {
  value = data.aws_ami.amazon_linux_2023
}

