variable "project_name" {
  description = "Project name (e.g. Taimoor)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. Prod, Dev)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
