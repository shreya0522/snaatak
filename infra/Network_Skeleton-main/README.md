#Network Skeleton
Use Below Root Module for calling the child module of Network

main.tf
```
module "network_skeleton" {
  source = "git::https://github.com/OT-MyGurukulam/Network_Skeleton.git" -->
  vpc_cidr         = var.vpc_cidr
  vpc_name         = var.vpc_name
  env              = var.env
  destination-cidr = var.destination-cidr
  private_subnet   = var.private_subnet
  public_subnet    = var.public_subnet
  public-rt-name   = var.public-rt-name
  private-rt-name  = var.private-rt-name
  igw_name         = var.igw_name
  eip_name         = var.eip_name
  nat_name         = var.nat_name
}
```

terraform.tfvars
```
#VPC
vpc_name = "non-prod-vpc"
vpc_cidr = "10.0.1.0/25"
env      = "non-prod"
#Public RT
public-rt-name = "non-prod-pub-rt"
#Private RT
private-rt-name = "non-prod-private-rt"
#Destination CIDR
destination-cidr = "0.0.0.0/0"
#IGW
igw_name = "non-prod-igw"
#EIP
eip_name = "non-prod-eip"
#NAT
nat_name = "non-prod-nat"
#Private Subnet
private_subnet = {
  "dev-frontend" = {
    cidr = "10.0.1.16/28"
    az   = "us-east-1a"
    tag  = "dev"
  },
  "dev-backend" = {
    cidr = "10.0.1.32/28"
    az   = "us-east-1a"
    tag  = "dev"
  },
  "dev-db" = {
    cidr = "10.0.1.48/28"
    az   = "us-east-1a"
    tag  = "dev"
  },
  "qa-frontend" = {
    cidr = "10.0.1.64/28"
    az   = "us-east-1a"
    tag  = "qa"
  },
  "qa-backend" = {
    cidr = "10.0.1.80/28"
    az   = "us-east-1a"
    tag  = "qa"
  },
  "qa-db" = {
    cidr = "10.0.1.96/28"
    az   = "us-east-1a"
    tag  = "qa"
  }
}
#Public Subnet
public_subnet = {
  "dev-public" = {
    cidr = "10.0.1.0/28"
    az   = "us-east-1a"
    tag  = "dev"
  },
  "qa-public" = {
    cidr = "10.0.1.112/28"
    az   = "us-east-1b"
    tag  = "qa"
  }
}
```

var.tf
```
############ VPC ##############
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the VPC"
  type        = string
}

variable "env" {
  description = "Name tag of the VPC"
  type        = string
}

############ Public Subnet ##############

variable "public_subnet" {
  description = "Map of private subnets"
  type = map(object({
    cidr = string
    az   = string
    tag  = string
  }))
}
############ Public Route Table ##############
variable "public-rt-name" {
  type = string
}
variable "destination-cidr" {
  type = string
}


############ Private Subnet ##############
variable "private_subnet" {
  description = "Map of private subnets"
  type = map(object({
    cidr = string
    az   = string
    tag  = string
  }))
}

############ IGW ##############
variable "igw_name" {
  type = string
}

############ Private Route Table ##############
variable "private-rt-name" {
  type = string
}

############ Elastic IP ##############
variable "eip_name" {
  type = string
}

############ NAT ##############
variable "nat_name" {
  type = string
}
```

output.tf
```
################ VPC ###################
output "vpc_id" {
  value = module.network_skeleton.vpc_id
}

################ Public Subnet ###################
output "dev_public_subnet_id" {
  value = module.network_skeleton.public_subnet_id["dev-public"]
}

output "qa_public_subnet_id" {
  value = module.network_skeleton.public_subnet_id["qa-public"]
}

################ Private Subnet ###################
output "dev_frontend_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["dev-frontend"]
}

output "dev_backend_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["dev-backend"]
}

output "dev_db_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["dev-db"]
}

output "qa_frontend_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["qa-frontend"]
}

output "qa_backend_private_subnet_id" {
  value = module.network_skeleton.private_subnet_id["qa-backend"]
}

output "qa_db_private_subnet_id" {
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

#Change the region according to your choice
providers.tf
```
terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}