output "internal_alb_dns" {
  value = aws_lb.internal_alb.dns_name
}

output "app_tg_arn" {
  value = aws_lb_target_group.app_tg.arn
}
