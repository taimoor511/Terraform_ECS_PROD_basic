locals {
  prefix = "${var.project_name}-${var.environment}"
}

# ─── APPLICATION LOAD BALANCER ───────────────────────────────────────────────

resource "aws_lb" "this" {
  name               = "${local.prefix}-LB"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"

  security_groups = [var.lb_sg_id]
  subnets         = var.public_subnet_ids

  tags = merge(var.tags, {
    Name = "${local.prefix}-LB"
  })
}

# ─── LISTENER: HTTP 80 → Forward to Backend TG ───────────────────────────────

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.backend_tg_arn
  }

  tags = merge(var.tags, {
    Name = "${local.prefix}-listener-http"
  })
}
