locals {
  prefix = "${var.project_name}-${var.environment}"
}

resource "aws_lb_target_group" "backend" {
  name        = "${local.prefix}-BE-TG"
  target_type = "ip"
  protocol    = "HTTP"
  port        = 80
  ip_address_type = "ipv4"
  vpc_id      = var.vpc_id

  protocol_version = "HTTP1"

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = var.health_check_path
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 15
    interval            = 30
    matcher             = "200"
  }

  tags = merge(var.tags, {
    Name = "${local.prefix}-BE-TG"
  })
}
