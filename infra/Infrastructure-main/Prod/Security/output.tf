output "salary_sg01_id" {
  value = module.salary_sg[0].security_group_id
}
output "salary_sg02_id" {
  value = module.salary_sg[1].security_group_id
}

output "employee_sg01_id" {
  value = module.employee_sg[0].security_group_id
}
output "employee_sg02_id" {
  value = module.employee_sg[1].security_group_id
}

output "attendance_sg01_id" {
  value = module.attendance_sg[0].security_group_id
}
output "attendance_sg02_id" {
  value = module.attendance_sg[1].security_group_id
}

output "frontend_sg01_id" {
  value = module.frontend_sg[0].security_group_id
}
output "frontend_sg02_id" {
  value = module.frontend_sg[1].security_group_id
}

output "redis_sg01_id" {
  value = module.redis_sg[0].security_group_id
}
output "redis_sg02_id" {
  value = module.redis_sg[1].security_group_id
}

output "scylla_sg01_id" {
  value = module.scylla_sg[0].security_group_id
}
output "scylla_sg02_id" {
  value = module.scylla_sg[1].security_group_id
}

output "postgres_sg01_id" {
  value = module.postgres_sg[0].security_group_id
}
output "postgres_sg02_id" {
  value = module.postgres_sg[1].security_group_id
}

output "alb_sg_id" {
  value = module.alb_security_group.security_group_id
}
