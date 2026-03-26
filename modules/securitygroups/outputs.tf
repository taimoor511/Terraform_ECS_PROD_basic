output "lb_sg_id" {
  description = "ID of the Load Balancer security group"
  value       = aws_security_group.lb.id
}

output "backend_sg_id" {
  description = "ID of the Backend Service security group"
  value       = aws_security_group.backend.id
}
