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

variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/health"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
