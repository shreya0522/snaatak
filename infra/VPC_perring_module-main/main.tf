resource "aws_vpc_peering_connection" "peering_connection" {
  vpc_id      = var.ot-management_VPC
  peer_vpc_id = var.ot-non-prod_VPC
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

# Associate the peering connection with a route table in VPC1
resource "aws_route" "route_to_peer" {
  route_table_id            = var.ot-mgmt-private-rt_rt
  destination_cidr_block    = var.ot-non-prod_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
}

# Associate the peering connection with a route table in VPC2
resource "aws_route" "route_to_peer_vpc2" {
  route_table_id            = var.non-prod_dev_private-rt_rt
  destination_cidr_block    = var.ot-management_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
}