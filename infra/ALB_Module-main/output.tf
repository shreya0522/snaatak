output "alb_arn" {
  value = aws_lb.alb.*.arn
}
output "dns_name" {
  value = aws_lb.alb.*.dns_name
}
output "zone_id" {
  value = aws_lb.alb.*.zone_id
}
output "tg_arn" {
  value = aws_lb_target_group.lb_tg.*.arn
}
