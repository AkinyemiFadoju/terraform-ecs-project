# create application load balancer
resource "aws_lb" "application_load_balancer" {
  name                       = "${var.project_title}-${var.environment}-alb"
  internal                   = false #because our alb is internet facing
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_security_group.id]
  subnets                    = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]#alb has to always have a reach to my public subnet
  enable_deletion_protection = false

  tags   = {
    Name = "${var.project_title}-${var.environment}-alb"
  }
}

# create target group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.project_title}-${var.environment}-tg"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200,301,302"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect" #The listener will be redirecting traffic from HTTP to HTTPS

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn  = aws_lb.application_load_balancer.arn  #The ARN of our application load balancer
  port               = 443
  protocol           = "HTTPS"
  ssl_policy         = "ELBSecurityPolicy-2016-08"
  certificate_arn    = aws_acm_certificate.acm_certificate.arn

  default_action {
    type             = "forward" #Because this listerner will forward traffic to our target group
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}