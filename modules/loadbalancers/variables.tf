variable "project_name" {
  description = "Project name (e.g. Taimoor)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. Prod, Dev)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID — auto passed from VPC module output"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of 2 public subnet IDs — auto passed from VPC module output"
  type        = list(string)
}

variable "lb_sg_id" {
  description = "LB Security Group ID — auto passed from security groups module output"
  type        = string
}

variable "backend_tg_arn" {
  description = "Backend Target Group ARN — auto passed from target groups module output"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
