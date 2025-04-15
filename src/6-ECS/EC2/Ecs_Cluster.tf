/*
resource "aws_ecs_cluster" "foo" {
  name = "white-hart"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
*/

# Configure ECS cluster

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster"
}

resource "aws_ecs_capacity_provider" "ecs_capacity_provider" {
  name = "webapp-cp"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.ecs_asg.arn
    managed_scaling {
      maximum_scaling_step_size = 1000
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 100 # o ECS tentará manter a utilização do grupo de Auto Scaling em 100% da capacidade total
    }
  }
}
