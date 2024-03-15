variable "ot-management_cidr_block" {
  default = "10.0.0.0/26"
}

variable "ot-non-prod_cidr_block" {
  default = "10.0.1.0/25"
}

variable "ot-management_VPC" {
  default = "vpc-02ea67837d9dbb2f4"
}

variable "ot-non-prod_VPC" {
  default = "vpc-0808ca67b26a91291"
}

variable "ot-mgmt-private-rt_rt" {
  default = "rtb-046bdacc667479623"
}

variable "non-prod_dev_private-rt_rt" {
  default = "rtb-0070814377dbe3c0c"
}