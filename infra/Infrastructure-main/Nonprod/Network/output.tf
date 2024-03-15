################ VPC ###################
output "vpc_id" {
  value = module.network_skeleton.vpc_id
}

################ Public Subnet ###################
output "public01_subnet_id" {
  value = module.network_skeleton.public_subnet_id["dev-public"]
}

output "public02_subnet_id" {
  value = module.network_skeleton.public_subnet_id["qa-public"]
}

################ Private Subnet ###################
output "frontend01_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["dev-frontend"]
}

output "backend01_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["dev-backend"]
}

output "db01_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["dev-db"]
}

output "frontend02_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["qa-frontend"]
}

output "backend02_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["qa-backend"]
}

output "db02_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["qa-db"]
}

################ Public Route table ###################
output "public_route_table_id" {
  value = module.network_skeleton.public_rt_id
}

################ Private Route table ###################
output "private_route_table_id" {
  value = module.network_skeleton.private_route_table_id
}

################ NAT ###################
output "nat" {
  value = module.network_skeleton.nat
}

################ IGW ###################
output "igw" {
  value = module.network_skeleton.igw
}

################ NACL Ids ################### 
output "frontend01_nacl_id" {
  value = module.network_skeleton.nacl_id["dev-frontend"]["id"]
}

output "backend01_nacl_id" {
  value = module.network_skeleton.nacl_id["dev-backend"]["id"]
}

output "db01_nacl_id" {
  value = module.network_skeleton.nacl_id["dev-db"]["id"]
}

output "frontend02_nacl_id" {
  value = module.network_skeleton.nacl_id["qa-frontend"]["id"]
}

output "backend02_nacl_id" {
  value = module.network_skeleton.nacl_id["qa-backend"]["id"]
}

output "db02_nacl_id" {
  value = module.network_skeleton.nacl_id["qa-db"]["id"]
}

#NACL Association ids
output "frontend01_nacl_association_ids" {
  value = module.network_skeleton.nacl_association_ids["dev-frontend"]["id"]
}

output "backend01_nacl_association_ids" {
  value = module.network_skeleton.nacl_association_ids["dev-backend"]["id"]
}

output "db01_nacl_association_ids" {
  value = module.network_skeleton.nacl_association_ids["dev-db"]["id"]
}

output "frontend02_nacl_association_ids" {
  value = module.network_skeleton.nacl_association_ids["qa-frontend"]["id"]
}

output "backend02_nacl_association_ids" {
  value = module.network_skeleton.nacl_association_ids["qa-backend"]["id"]
}

output "db02_nacl_association_ids" {
  value = module.network_skeleton.nacl_association_ids["qa-db"]["id"]
}

output "vpc_peering_connection_id" {
  value = module.network_skeleton.vpc_peering_connection_id
}