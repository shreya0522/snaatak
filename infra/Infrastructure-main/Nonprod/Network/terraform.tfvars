vpc_cidr                 = "10.0.1.0/25"
vpc_name                 = "non-prod-vpc"
env                      = "non-prod"
public-rt-name           = "non-prod-pub-rt"
private-rt-name          = "non-prod-private-rt"
destination-cidr         = "0.0.0.0/0"
igw_name                 = "non-prod-igw"
eip_name                 = "non-prod-eip"
nat_name                 = "non-prod-nat"
ot-management_cidr_block = "10.0.0.0/26"
ot-management_VPC        = "vpc-0b2f0c52f0fa53fe3"
ot-mgmt-private-rt_rt    = "rtb-0b0816b4956fc47f9"
ot-mgmt-public-rt_rt     = "rtb-0557d8c9d3859bae8"

private_subnet = {
  "dev-frontend" = { cidr = "10.0.1.16/28", az = "us-east-1a", tag = "dev" },
  "dev-backend"  = { cidr = "10.0.1.32/28", az = "us-east-1a", tag = "dev" },
  "dev-db"       = { cidr = "10.0.1.48/28", az = "us-east-1a", tag = "dev" },
  "qa-frontend"  = { cidr = "10.0.1.64/28", az = "us-east-1a", tag = "qa" },
  "qa-backend"   = { cidr = "10.0.1.80/28", az = "us-east-1a", tag = "qa" },
  "qa-db"        = { cidr = "10.0.1.96/28", az = "us-east-1a", tag = "qa" }
}

public_subnet = {
  "dev-public" = { cidr = "10.0.1.0/28", az = "us-east-1a", tag = "dev" },
  "qa-public"  = { cidr = "10.0.1.112/28", az = "us-east-1b", tag = "qa" }
}

nacl_list = {
  "dev-frontend" = {
    name = "dev-frontend"
    env  = "dev"
    ingress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 80, to_port = 80, protocol = "tcp", action = "allow", cidr_block = "10.0.1.0/28" },
      { rule_no = 120, from_port = 80, to_port = 80, protocol = "tcp", action = "allow", cidr_block = "10.0.1.64/28" },
      { rule_no = 130, from_port = 8080, to_port = 8080, protocol = "tcp", action = "allow", cidr_block = "10.0.1.32/28" }
    ]
    egress = [
      { rule_no = 100, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      # { rule_no    = 110, from_port  = 80, to_port    = 80, action     = "allow", protocol   = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 120, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      # { rule_no    = 130, from_port  = 1024, to_port    = 65535, action     = "allow", protocol   = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 140, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 150, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 160, from_port = 8080, to_port = 8080, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 170, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" }
    ]
  },
  "dev-backend" = {
    name = "dev-backend"
    env  = "dev"
    ingress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 8080, to_port = 8080, protocol = "tcp", action = "allow", cidr_block = "10.0.1.0/28" },
      { rule_no = 120, from_port = 8080, to_port = 8080, protocol = "tcp", action = "allow", cidr_block = "10.0.1.64/28" },
      { rule_no = 130, from_port = 8080, to_port = 8080, protocol = "tcp", action = "allow", cidr_block = "10.0.1.48/28" }
    ]
    egress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 8080, to_port = 8080, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 120, from_port = 8080, to_port = 8080, action = "allow", protocol = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 130, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 140, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 150, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 160, from_port = 5432, to_port = 5432, action = "allow", protocol = "tcp", cidr_block = "10.0.1.48/28" },
      { rule_no = 170, from_port = 6379, to_port = 6379, action = "allow", protocol = "tcp", cidr_block = "10.0.1.48/28" },
      { rule_no = 180, from_port = 9042, to_port = 9042, action = "allow", protocol = "tcp", cidr_block = "10.0.1.48/28" },
      { rule_no = 190, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.48/28" }
    ]
  },
  "dev-db" = {
    name = "dev-db"
    env  = "dev"
    ingress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 6379, to_port = 6379, protocol = "tcp", action = "allow", cidr_block = "10.0.1.32/28" },
      { rule_no = 120, from_port = 9042, to_port = 9042, protocol = "tcp", action = "allow", cidr_block = "10.0.1.32/28" },
      { rule_no = 130, from_port = 5432, to_port = 5432, protocol = "tcp", action = "allow", cidr_block = "10.0.1.32/28" }
    ]
    egress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 6379, to_port = 6379, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 120, from_port = 9042, to_port = 9042, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 130, from_port = 5432, to_port = 5432, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 140, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 150, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" }
    ]
  },
  "qa-frontend" = {
    name = "qa-frontend"
    env  = "qa"
    ingress = [
      { rule_no = 100, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 110, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 120, from_port = 22, to_port = 22, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" }
    ]
    egress = [
      { rule_no = 100, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 110, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 120, from_port = 22, to_port = 22, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 130, from_port = 8080, to_port = 8080, protocol = "tcp", action = "allow", cidr_block = "10.0.1.96/28" },
      { rule_no = 140, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 150, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 160, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 170, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.96/28" }
    ]
  },
  "qa-backend" = {
    name = "qa-backend"
    env  = "qa"
    ingress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 120, from_port = 8080, to_port = 8080, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 130, from_port = 8080, to_port = 8080, action = "allow", protocol = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 140, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.112/28" }
    ]
    egress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 120, from_port = 8080, to_port = 8080, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 130, from_port = 8080, to_port = 8080, action = "allow", protocol = "tcp", cidr_block = "10.0.1.64/28" },
      { rule_no = 140, from_port = 5432, to_port = 5432, action = "allow", protocol = "tcp", cidr_block = "10.0.1.112/28" },
      { rule_no = 150, from_port = 6379, to_port = 6379, action = "allow", protocol = "tcp", cidr_block = "10.0.1.112/28" },
      { rule_no = 160, from_port = 9042, to_port = 9042, action = "allow", protocol = "tcp", cidr_block = "10.0.1.112/28" },
      { rule_no = 170, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 180, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 190, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.112/28" }
    ]
  },
  "qa-db" = {
    name = "qa-db"
    env  = "qa"
    ingress = [
      { rule_no = 100, from_port = 5432, to_port = 5432, action = "allow", protocol = "tcp", cidr_block = "10.0.1.96/28" },
      { rule_no = 110, from_port = 6379, to_port = 6379, action = "allow", protocol = "tcp", cidr_block = "10.0.1.96/28" },
      { rule_no = 120, from_port = 9042, to_port = 9042, action = "allow", protocol = "tcp", cidr_block = "10.0.1.96/28" },
      { rule_no = 130, from_port = 22, to_port = 22, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" }
    ]
    egress = [
      { rule_no = 100, from_port = 5432, to_port = 5432, action = "allow", protocol = "tcp", cidr_block = "10.0.1.96/28" },
      { rule_no = 150, from_port = 6379, to_port = 6379, action = "allow", protocol = "tcp", cidr_block = "10.0.1.96/28" },
      { rule_no = 160, from_port = 9042, to_port = 9042, action = "allow", protocol = "tcp", cidr_block = "10.0.1.96/28" },
      { rule_no = 170, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 180, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 190, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.96/28" }
    ]
  }
}
