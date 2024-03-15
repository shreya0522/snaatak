#########VPC##############
output "vpc_id" {
  value = aws_vpc.vpc.id
}
#########Public Subnet##############
output "public_subnet_id" {
  value = { for subnet in aws_subnet.public_subnet : subnet.tags.Name => subnet.id }
}

output "public_subnet_set" {
  value = toset(values(aws_subnet.public_subnet)[*].id)
}

#########Private Subnet##############
output "private_subnet_id" {
  value = { for subnet in aws_subnet.private_subnet : subnet.tags.Name => subnet.id }
}

output "private_subnet_set" {
  value = toset(values(aws_subnet.private_subnet)[*].id)
}

#########Public Route Table##############
output "public_rt_id" {
  value = aws_route_table.public_rt.*.id
}

#########Private Route table ##############
output "private_route_table_id" {
  value = aws_route_table.private_rt.*.id
}

######### NAT ##############
output "nat" {
  value = aws_internet_gateway.igw.id
}

######### IGW ##############
output "igw" {
  value = aws_internet_gateway.igw.id
}

######### NACL ##############
output "nacl_id" {
  value = aws_network_acl.nacl
}

output "nacl_association_ids" {
  value = aws_network_acl_association.nacl_association
}

##### VPC Peering ID ######
output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.peering_connection.id
}
