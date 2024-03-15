vpc_cidr                 = "10.0.1.0/25"
vpc_name                 = "prod-vpc"
env                      = "prod"
public-rt-name           = "prod-pub-rt"
private-rt-name          = "prod-private-rt"
destination-cidr         = "0.0.0.0/0"
igw_name                 = "prod-igw"
eip_name                 = "prod-eip"
nat_name                 = "prod-nat"
ot-management_cidr_block = "10.0.0.0/16"
ot-management_VPC        = "vpc-0a8bb1b672c2b6776" //"vpc-0c63148c111300458" //"vpc-0a8bb1b672c2b6776"
ot-mgmt-private-rt_rt    = "rtb-0c6cd13441006ccdb" //"rtb-0db9221a176cee5fb" //"rtb-0c6cd13441006ccdb"
ot-mgmt-public-rt_rt     = "rtb-0375b5b9bb72ee32c" //"rtb-0813e7066c21fc75a" //"rtb-0375b5b9bb72ee32c" 
                                                                   
private_subnet = {
  "frontend01" = { cidr = "10.0.1.16/28", az = "us-east-1a", tag = "prod" },
  "backend01"  = { cidr = "10.0.1.32/28", az = "us-east-1a", tag = "prod" },
  "db01"       = { cidr = "10.0.1.48/28", az = "us-east-1a", tag = "prod" },
  "frontend02" = { cidr = "10.0.1.64/28", az = "us-east-1b", tag = "prod" },
  "backend02"  = { cidr = "10.0.1.80/28", az = "us-east-1b", tag = "prod" },
  "db02"       = { cidr = "10.0.1.96/28", az = "us-east-1b", tag = "prod" }
}

public_subnet = {
  "public01" = { cidr = "10.0.1.0/28", az = "us-east-1b", tag = "prod" },
  "public02" = { cidr = "10.0.1.112/28", az = "us-east-1c", tag = "prod" }
}

nacl_list = {
  "frontend01" = {
    name = "frontend01"
    env  = "prod"
    ingress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 80, to_port = 80, protocol = "tcp", action = "allow", cidr_block = "10.0.1.0/28" },
      { rule_no = 120, from_port = 80, to_port = 80, protocol = "tcp", action = "allow", cidr_block = "10.0.1.112/28" }
    ]
    egress = [
      { rule_no = 100, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 110, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "10.0.1.112/28" },
      { rule_no = 120, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.0/28" },
      { rule_no = 130, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.112/28" },
      { rule_no = 140, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 150, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" }
    ]
  },
  "backend01" = {
    name = "backend01"
    env  = "prod"
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
  "db01" = {
    name = "db01"
    env  = "prod"
    ingress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 6379, to_port = 6379, protocol = "tcp", action = "allow", cidr_block = "10.0.1.32/28" },
      { rule_no = 120, from_port = 9042, to_port = 9042, protocol = "tcp", action = "allow", cidr_block = "10.0.1.32/28" },
      { rule_no = 130, from_port = 5432, to_port = 5432, protocol = "tcp", action = "allow", cidr_block = "10.0.1.32/28" },
      { rule_no = 140, from_port = 1024, to_port = 65535, protocol = "tcp", action = "allow", cidr_block = "0.0.0.0/0" },
      { rule_no = 150, from_port = 5432, to_port = 5432, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 160, from_port = 9042, to_port = 9042, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 170, from_port = 6379, to_port = 6379, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" }
    ]
    egress = [
      { rule_no = 100, from_port = 22, to_port = 22, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 110, from_port = 6379, to_port = 6379, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 120, from_port = 9042, to_port = 9042, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 130, from_port = 5432, to_port = 5432, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 140, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.1.32/28" },
      { rule_no = 150, from_port = 1024, to_port = 65535, action = "allow", protocol = "tcp", cidr_block = "10.0.0.0/26" },
      { rule_no = 160, from_port = 80, to_port = 80, action = "allow", protocol = "tcp", cidr_block = "0.0.0.0/0" },
      { rule_no = 170, from_port = 443, to_port = 443, action = "allow", protocol = "tcp", cidr_block = "0.0.0.0/0" },
      { rule_no = 180, from_port = 5432, to_port = 5432, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 190, from_port = 1024, to_port = 65535, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 200, from_port = 9042, to_port = 9042, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 210, from_port = 1024, to_port = 65535, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 220, from_port = 6379, to_port = 6379, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" },
      { rule_no = 230, from_port = 1024, to_port = 65535, protocol = "tcp", action = "allow", cidr_block = "10.0.0.0/26" }
    ]
  },
  "frontend02" = {
    name = "frontend02"
    env  = "prod"
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
  "backend02" = {
    name = "backend02"
    env  = "prod"
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
  "db02" = {
    name = "db02"
    env  = "prod"
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
