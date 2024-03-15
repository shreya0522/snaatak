################ VPC ###################
output "vpc_id" {
  value = module.network_skeleton.vpc_id
}

################ Public Subnet ###################
output "public01_subnet_id" {
  value = module.network_skeleton.public_subnet_id["public01"]
}

output "public02_subnet_id" {
  value = module.network_skeleton.public_subnet_id["public02"]
}

# ################ Private Subnet ###################
output "frontend01_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["frontend01"]
}

output "backend01_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["backend01"]
}

output "db01_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["db01"]
}

output "frontend02_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["frontend02"]
}

output "backend02_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["backend02"]
}

output "db02_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["db02"]
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
  value = module.network_skeleton.nacl_id["frontend01"]["id"]
}

output "backend01_nacl_id" {
  value = module.network_skeleton.nacl_id["backend01"]["id"]
}

output "db01_nacl_id" {
  value = module.network_skeleton.nacl_id["db01"]["id"]
}

output "frontend02_nacl_id" {
  value = module.network_skeleton.nacl_id["frontend02"]["id"]
}

output "backend02_nacl_id" {
  value = module.network_skeleton.nacl_id["backend02"]["id"]
}

output "db02_nacl_id" {
  value = module.network_skeleton.nacl_id["db02"]["id"]
}

output "vpc_peering_connection_id" {
  value = module.network_skeleton.vpc_peering_connection_id
}