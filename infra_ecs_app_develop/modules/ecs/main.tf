resource "aws_ecs_cluster" "develop" {
  name = "my-ecs-cluster"
}

resource "aws_ecs_task_definition" "myapp" {
  family                   = "myapp-task"
  container_definitions    = file("${path.module}/ecs-task-def.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.ecs_task_execution_role_arn
}

resource "aws_ecs_service" "myapp" {
  name            = "myapp-service"
  cluster         = aws_ecs_cluster.develop.id
  task_definition = aws_ecs_task_definition.myapp.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.security_group_id]
    assign_public_ip = true
  }
}
