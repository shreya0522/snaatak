resource "aws_lb" "alb" {
  count                      = length(var.alb_name)
  name                       = var.alb_name[count.index]
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = var.alb_security_groups
  subnets                    = var.alb_subnets
  enable_deletion_protection = false
  tags = {
  Env = var.env
  }
}

resource "aws_lb_target_group" "lb_tg" {
  count       = length(var.tg_name)
  name        = var.tg_name[count.index]
  port        = var.tg_port[count.index]
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
  health_check {
    healthy_threshold   = 2
    interval            = 15
    path                = var.health_check_path[count.index]
    unhealthy_threshold = 3
  }
  tags = {
  Env = var.env
  }
}


resource "aws_lb_listener" "http_listener" {
  count             = length(aws_lb.alb)
  load_balancer_arn = aws_lb.alb[count.index].arn
  protocol          = "HTTP"
  port              = "80"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg[count.index].arn

  }
  tags = {
  Env = var.env
  }
}

resource "aws_lb_listener" "https_listener" {
  count             = var.create_https_listener ? 1 : 0
  load_balancer_arn = aws_lb.alb[count.index].arn
  protocol          = "HTTPS"
  port              = "443"
  ssl_policy        = var.ssl_policy_name
  certificate_arn   = var.ssl_cert_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg[count.index].arn

  }
  tags = {
  Env = var.env
  }
}

resource "aws_lb_listener_rule" "http_listener_rule" {
  count        = length(var.rules)
  listener_arn = aws_lb_listener.http_listener[0].arn
  priority     = var.rules[count.index].priority

  dynamic "condition" {
    for_each = var.rules[count.index].path_pattern != null ? [1] : []
    content {
      path_pattern {
        values = var.rules[count.index].path_pattern
      }
    }
  }

  dynamic "condition" {
    for_each = var.rules[count.index].host_header != null ? [1] : []
    content {
      host_header {
        values = var.rules[count.index].host_header
      }
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg[count.index].arn
  }
  tags = {
  Env = var.env
  }
}