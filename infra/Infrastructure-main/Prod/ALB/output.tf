output "alb_arn" {
  value = module.alb.alb_arn[0]
}

output "name" {
  value = module.alb.dns_name[0] 
}

output "zone_id" {
  value = module.alb.zone_id[0]
}

output "tg_arn" {
  value = module.alb.tg_arn
}
