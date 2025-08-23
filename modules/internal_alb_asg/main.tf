#### Launch Template 
resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-lt-"
  image_id      = var.app_ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile
  }

  network_interfaces {
    security_groups = [var.app_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app-tier-instance"
    }
  }
}

############ Target Group

resource "aws_lb_target_group" "app_tg" {
  name     = "app-tg"
  port     = 4000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    port                = "4000"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
}

##################### Internal Load Balancer

resource "aws_lb" "internal_alb" {
  name               = "app-internal-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.internal_alb_sg_id]
  subnets            = var.private_subnets
}

####### Listner

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.internal_alb.arn
  port              = 4000
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}


######### ASG

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = var.private_subnets

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  tag {
    key                 = "Name"
    value               = "app-tier-asg"
    propagate_at_launch = true
  }
}


