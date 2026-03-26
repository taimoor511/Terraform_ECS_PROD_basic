variable "project_name" {
  description = "Project name (e.g. Stablenft)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. Prod, Dev, Staging)"
  type        = string
}

variable "vpc_cidr" {
  description = "IPv4 CIDR block for the VPC (e.g. 10.0.0.0/16)"
  type        = string
}

variable "app_port" {
  description = "Port the backend service listens on (e.g. 3000)"
  type        = number
}
variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/health"
}