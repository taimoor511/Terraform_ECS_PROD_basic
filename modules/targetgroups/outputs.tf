output "backend_tg_arn" {
  description = "ARN of the backend target group"
  value       = aws_lb_target_group.backend.arn
}

output "backend_tg_name" {
  description = "Name of the backend target group"
  value       = aws_lb_target_group.backend.name
}
