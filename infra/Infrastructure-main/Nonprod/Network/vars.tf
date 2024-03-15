#########VPC##############
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the VPC"
  type        = string
}

######### Public Route Table##############
variable "public-rt-name" {
  type = string
}

######### Destination CIDR ##############
variable "destination-cidr" {
  type = string
}

######### IGW ##############
variable "igw_name" {
  type = string
}

#########Private Route##############
variable "private-rt-name" {
  type = string
}

######### Elastic IP ##############
variable "eip_name" {
  type = string
}

######### NAT ###
variable "nat_name" {
  type = string
}

variable "public_subnet" {
  description = "Ec2 instances attributes"
  type = map(object({
    cidr = string
    az   = string
    tag  = string
  }))
}

variable "private_subnet" {
  description = "Ec2 instances attributes"
  type = map(object({
    cidr = string
    az   = string
    tag  = string
  }))
}

variable "env" {
  description = "Name tag of the VPC"
  type        = string
}

####### NACL

variable "nacl_list" {
  type = map(object({
    name = string
    env  = string
    ingress = list(object({
      rule_no    = number
      from_port  = number
      to_port    = number
      action     = string
      protocol   = string
      cidr_block = string
    }))
    egress = list(object({
      rule_no    = number
      from_port  = number
      to_port    = number
      action     = string
      protocol   = string
      cidr_block = string
    }))
  }))
}

####### Variable for VPC peering ######
variable "ot-management_cidr_block" {
  type = string
}

variable "ot-management_VPC" {
  type = string
}

variable "ot-mgmt-private-rt_rt" {
  type = string
}
variable "ot-mgmt-public-rt_rt" {
  default = "rtb-0557d8c9d3859bae8"
}