module "network_skeleton" {
  source                = "git@github.com:OT-MyGurukulam/Network_Skeleton.git?ref=main"
  vpc_cidr              = var.vpc_cidr
  vpc_name              = var.vpc_name
  env                   = var.env
  private_subnet        = var.private_subnet
  public_subnet         = var.public_subnet
  destination-cidr      = var.destination-cidr
  public-rt-name        = var.public-rt-name
  igw_name              = var.igw_name
  private-rt-name       = var.private-rt-name
  eip_name              = var.eip_name
  nat_name              = var.nat_name
  nacl_list             = var.nacl_list
  ot-management_VPC     = var.ot-management_VPC
  ot-mgmt-private-rt_rt = var.ot-mgmt-private-rt_rt
}