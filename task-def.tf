resource "aws_ecs_task_definition" "arroyo-task-def" {
  family                   = local.proyect_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.ecs_exec_role.arn

  container_definitions = jsonencode([
    {
      name  = "${local.proyect_name}-challenge"
      image = "public.ecr.aws/q5r3q3x5/arroyo-ecr:latest"

      memory = 256
      cpu    = 256

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]

      essential = true
    }
  ])
}
