#### Launch Template 
resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = var.web_ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile
  }

  network_interfaces {
    security_groups = [var.web_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web-tier-instance"
    }
  }
}

############ Target Group

resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
}

##################### Internal Load Balancer

resource "aws_lb" "external_alb" {
  name               = "web-external-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnets
}

####### Listner

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}


######### ASG

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = var.public_subnets

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.web_tg.arn]

  tag {
    key                 = "Name"
    value               = "web-tier-asg"
    propagate_at_launch = true
  }
}


