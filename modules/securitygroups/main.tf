locals {
  prefix = "${var.project_name}-${var.environment}"
}

# ─── LB SECURITY GROUP ───────────────────────────────────────────────────────
# Allows HTTP (80) and HTTPS (443) from anywhere

resource "aws_security_group" "lb" {
  name        = "${local.prefix}-LB-SG"
  description = "Load balancer SG - allows HTTP and HTTPS from internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${local.prefix}-LB-SG"
  })
}

# ─── BACKEND SERVICE SECURITY GROUP ──────────────────────────────────────────
# Allows app port only from the LB SG (no direct internet access)

resource "aws_security_group" "backend" {
  name        = "${local.prefix}-BE-Service-SG"
  description = "Backend service SG - allows app port only from LB SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "App port from LB SG only"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${local.prefix}-BE-Service-SG"
  })
}
