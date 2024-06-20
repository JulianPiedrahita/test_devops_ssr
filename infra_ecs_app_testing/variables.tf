variable "aws_region" {
  description = "The AWS region to deploy in"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "image" {
  description = "The Docker image to use for the ECS task"
  default     = "<tu-uri-de-repositorio>:latest"
}
