#Child Module for VPC block
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
    Env  = var.env
  }
}

#Child Module for Public Subnet block
resource "aws_subnet" "public_subnet" {
  for_each          = var.public_subnet
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = each.key
    Env  = each.value.tag
  }
}

#Child Module for Private Subnet block
resource "aws_subnet" "private_subnet" {
  for_each          = var.private_subnet
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = each.key
    Env  = each.value.tag
  }
}

# Child Module for Public Route Table block
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.public-rt-name
    Env  = var.env
  }
}

resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.destination-cidr
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public-subnet-association" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}



# Child Module for IGW block
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
    Env  = var.env
  }
}

# Child Module for Private Route Table block
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.private-rt-name
    Env  = var.env
  }
}

resource "aws_route" "private-route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = var.destination-cidr
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private-subnet-association" {
  for_each       = aws_subnet.private_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_rt.id
}

# Child Module for Elastic IP 
resource "aws_eip" "eip" {
  tags = {
    Name = var.eip_name
    Env  = var.env
  }
}

# Child Module for NAT  
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = values(aws_subnet.public_subnet)[0].id
  tags = {
    Name = var.nat_name
    Env  = var.env
  }
}

# Child Module for Network ACL

resource "aws_network_acl" "nacl" {
  for_each = var.nacl_list
 
  vpc_id = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      rule_no    = ingress.value.rule_no
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
      action     = ingress.value.action
      protocol   = ingress.value.protocol
      cidr_block = ingress.value.cidr_block
    }
  }

  dynamic "egress" {
    for_each = each.value.egress
    content {
      rule_no    = egress.value.rule_no
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
      action     = egress.value.action
      protocol   = egress.value.protocol
      cidr_block = egress.value.cidr_block
    }
  }

  tags = {
    Name = each.value.name
    Env  = each.value.env
  }
}


# Network ACL association with private subnets
resource "aws_network_acl_association" "nacl_association" {
  for_each       = aws_subnet.private_subnet
  subnet_id      = each.value.id
  network_acl_id = aws_network_acl.nacl[each.key].id
}

# Child Module for VPC peering

resource "aws_vpc_peering_connection" "peering_connection" {
  vpc_id      = var.ot-management_VPC
  peer_vpc_id = aws_vpc.vpc.id
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = {
    Name = "peering_connection"
  }
}

# # Associate the peering connection with a route table in VPC1
# resource "aws_route" "route_to_peer" {
#   route_table_id            = var.ot-mgmt-private-rt_rt
#   destination_cidr_block    = var.vpc_cidr
#   vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
# }

# # Associate the peering connection with a route table in VPC2
# resource "aws_route" "route_to_peer_vpc2" {
#   route_table_id            = aws_route_table.private_rt.id
#   destination_cidr_block    = var.ot-management_cidr_block
#   vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
# }

# # Associate the peering connection with a route table in VPC2
# resource "aws_route" "route_to_peer_vpc3" {
#   route_table_id            = var.ot-mgmt-public-rt_rt
#   destination_cidr_block    = var.vpc_cidr
#   vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
# }