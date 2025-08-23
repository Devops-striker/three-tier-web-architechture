output "external_alb_dns" {
  value = aws_lb.external_alb.dns_name
}

output "web_tg_arn" {
  value = aws_lb_target_group.web_tg.arn
}
