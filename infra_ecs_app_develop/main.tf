provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "iam" {
  source = "./modules/iam"
}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  security_group_id = module.vpc.security_group_id
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  image = var.image
}

output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}
