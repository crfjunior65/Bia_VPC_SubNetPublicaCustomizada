<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.22.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.ecs_asg](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/autoscaling_group) | resource |
| [aws_ecs_account_setting_default.test](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/ecs_account_setting_default) | resource |
| [aws_ecs_capacity_provider.ecs_capacity_provider](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.example](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/ecs_task_definition) | resource |
| [aws_launch_template.ec2_lt](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/launch_template) | resource |
| [aws_lb.ecs_alb](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/lb) | resource |
| [aws_lb_listener.ecs_alb_listener](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.ecs_tg](https://registry.terraform.io/providers/hashicorp/aws/5.22.0/docs/resources/lb_target_group) | resource |
| [terraform_remote_state.ecr](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.efs](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.orquestrador](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.rds](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.sg](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_count"></a> [app\_count](#input\_app\_count) | n/a | `number` | `2` | no |
| <a name="input_autor"></a> [autor](#input\_autor) | Autor de edição. | `string` | n/a | yes |
| <a name="input_cdirs_acesso_remoto"></a> [cdirs\_acesso\_remoto](#input\_cdirs\_acesso\_remoto) | n/a | `list(any)` | <pre>[<br>  "0.0.0.0/0",<br>  "187.180.212.28/32",<br>  "200.181.118.98/32"<br>]</pre> | no |
| <a name="input_cliente"></a> [cliente](#input\_cliente) | Cliente do projeto. | `string` | n/a | yes |
| <a name="input_dynamic_scaling"></a> [dynamic\_scaling](#input\_dynamic\_scaling) | Enable/disable dynamic scaling of the auto scaling group. | `bool` | `false` | no |
| <a name="input_dynamic_scaling_adjustment"></a> [dynamic\_scaling\_adjustment](#input\_dynamic\_scaling\_adjustment) | The adjustment in number of instances for dynamic scaling. | `number` | `1` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment; will be prefixed to all resources. | `string` | `"Projeto20"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"KeyPar-072024"` | no |
| <a name="input_projeto"></a> [projeto](#input\_projeto) | Descrição do projeto. | `string` | n/a | yes |
| <a name="input_regiao"></a> [regiao](#input\_regiao) | Região onde a infraestrutura será criada. | `string` | n/a | yes |
| <a name="input_shortnameid"></a> [shortnameid](#input\_shortnameid) | Nome curto para identificação dos recursos na AWS | `string` | n/a | yes |
| <a name="input_user_names"></a> [user\_names](#input\_user\_names) | Name of the User. | `list(string)` | <pre>[<br>  "XXX",<br>  "YYY",<br>  "ZZZ"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->