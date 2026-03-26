variable "project_name" {
  description = "Project name (e.g. Taimoor)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. Prod, Dev)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to create security groups in"
  type        = string
}

variable "app_port" {
  description = "Application port the backend service listens on (e.g. 3000)"
  type        = number
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
