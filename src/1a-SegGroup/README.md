<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.86.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.bia-alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia-db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia-dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia-dev-mssql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia-web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.mssql-db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amis"></a> [amis](#input\_amis) | n/a | `map(any)` | <pre>{<br>  "Ubnt-us-east-1": "ami-0261755bbcb8c4a84",<br>  "Ubnt-us-east-2": "ami-0430580de6244e02e"<br>}</pre> | no |
| <a name="input_app_count"></a> [app\_count](#input\_app\_count) | n/a | `number` | `2` | no |
| <a name="input_cdirs_acesso_remoto"></a> [cdirs\_acesso\_remoto](#input\_cdirs\_acesso\_remoto) | n/a | `list(any)` | <pre>[<br>  "0.0.0.0/0",<br>  "189.98.249.53/32",<br>  "200.181.118.98/32"<br>]</pre> | no |
| <a name="input_create_database_subnet_group"></a> [create\_database\_subnet\_group](#input\_create\_database\_subnet\_group) | VPC Create Database Subnet Group, Controls if database subnet group should be created | `bool` | `true` | no |
| <a name="input_create_database_subnet_route_table"></a> [create\_database\_subnet\_route\_table](#input\_create\_database\_subnet\_route\_table) | VPC Create Database Subnet Route Table, Controls if separate route table for database should be created | `bool` | `true` | no |
| <a name="input_dynamic_scaling"></a> [dynamic\_scaling](#input\_dynamic\_scaling) | Enable/disable dynamic scaling of the auto scaling group. | `bool` | `false` | no |
| <a name="input_dynamic_scaling_adjustment"></a> [dynamic\_scaling\_adjustment](#input\_dynamic\_scaling\_adjustment) | The adjustment in number of instances for dynamic scaling. | `number` | `1` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"bia"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"KeyPar-072024"` | no |
| <a name="input_user_names"></a> [user\_names](#input\_user\_names) | Name of the User. | `list(string)` | <pre>[<br>  "XXX",<br>  "YYY",<br>  "ZZZ"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_bia_alb"></a> [sg\_bia\_alb](#output\_sg\_bia\_alb) | SG Acesso a Instancia Id |
| <a name="output_sg_bia_db"></a> [sg\_bia\_db](#output\_sg\_bia\_db) | SG Acesso a Instancia Id |
| <a name="output_sg_bia_dev"></a> [sg\_bia\_dev](#output\_sg\_bia\_dev) | SG Acesso a Instancia Id |
| <a name="output_sg_bia_dev_mssql"></a> [sg\_bia\_dev\_mssql](#output\_sg\_bia\_dev\_mssql) | SG Acesso a Instancia Id |
| <a name="output_sg_bia_ec2"></a> [sg\_bia\_ec2](#output\_sg\_bia\_ec2) | SG Acesso a Instancia Id |
| <a name="output_sg_bia_web"></a> [sg\_bia\_web](#output\_sg\_bia\_web) | SG Acesso a Instancia Id |
| <a name="output_sg_mssql_db"></a> [sg\_mssql\_db](#output\_sg\_mssql\_db) | SG Acesso a Instancia Id |
<!-- END_TF_DOCS -->