output "redis01_private_ip" {
  description = "Private IP address of the redis01 EC2 instance"
  value       = module.redis01.private_ip
}
output "redis02_private_ip" {
  description = "Private IP address of the redis02 EC2 instance"
  value       = module.redis02.private_ip
}

output "scylla01_private_ip" {
  description = "Private IP address of the redis01 EC2 instance"
  value       = module.scylla01.private_ip
}
output "scylla02_private_ip" {
  description = "Private IP address of the redis02 EC2 instance"
  value       = module.scylla02.private_ip
}

output "postgress01_private_ip" {
  description = "Private IP address of the redis01 EC2 instance"
  value       = module.postgress01.private_ip
}
output "postgress02_private_ip" {
  description = "Private IP address of the redis02 EC2 instance"
  value       = module.postgress02.private_ip
}