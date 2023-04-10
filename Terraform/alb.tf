resource "aws_lb" "alb" {
  name           = "casadavlex-load-balancer"
  load_balancer_type = "application"
  subnets        = aws_subnet.public.*.id
  security_groups = [aws_security_group.alb_sg.id]
}

resource "aws_lb_target_group" "casadavlex-tg" {
  name        = "casadavlex-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.casadavlex_vpc.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.health_check_path
    interval            = 30
  }
}

#redirecting all incomming traffic from ALB to the target group
resource "aws_lb_listener" "casadavlex" {
  load_balancer_arn = aws_lb.alb.id
  port              = var.app_ssl_port
  protocol          = "HTTPS"
  certificate_arn = aws_acm_certificate.cert.arn
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #enable above 2 if you are using HTTPS listner and change protocal from HTTPS to HTTPS
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.casadavlex-tg.arn
  }
}

resource "aws_lb_listener" "casadavlex_http" {
  load_balancer_arn = aws_lb.alb.id
  port              = var.app_port
  protocol          = "HTTP"
  default_action {
    type             = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"

    }
    
  }
}

# resource "aws_alb_listener_rule" "redirect_http_to_https" {
#   listener_arn = aws_alb_listener.casadavlex.arn

#   action {
#     type = "redirect"

#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
#}