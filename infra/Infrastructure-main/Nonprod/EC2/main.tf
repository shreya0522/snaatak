### Read network config from network statefile
data "terraform_remote_state" "network_config" {
  backend = "s3"

  config = {
    bucket         = "ot-microservise01"
    key            = "Network/Nonprod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nonprod_network"
  }
}

### Read security group config from network statefile
data "terraform_remote_state" "security_config" {
  backend = "s3"

  config = {
    bucket         = "ot-microservise01"
    key            = "Security/Nonprod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nonprod_network"
  }
}

###  EC2 MODULE ###
module "redis01" {
  source                      = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=main"
  security_groups             = try(toset([data.terraform_remote_state.security_config.outputs.redis_sg01_id]), null)
  key_name                    = var.key_name
  subnet_id                   = try(data.terraform_remote_state.network_config.outputs.db01_private_subnet_id, null)
  instance_profile_name       = var.instance_profile_name
  name                        = var.redis01.name
  ami                         = var.redis01.ami
  tool                        = var.redis01.tool
  env                         = var.redis01.env
  instance_type               = var.redis01.instance_type
  associate_public_ip_address = var.redis01.associate_public_ip
}

module "scylla01" {
  source                      = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=main"
  security_groups             = try(toset([data.terraform_remote_state.security_config.outputs.scylla_sg01_id]), null)
  key_name                    = var.key_name
  subnet_id                   = try(data.terraform_remote_state.network_config.outputs.db01_private_subnet_id, null)
  instance_profile_name       = var.instance_profile_name
  name                        = var.scylla01.name
  ami                         = var.scylla01.ami
  tool                        = var.scylla01.tool
  env                         = var.scylla01.env
  instance_type               = var.scylla01.instance_type
  associate_public_ip_address = var.scylla01.associate_public_ip
}

module "postgress01" {
  source                      = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=main"
  security_groups             = try(toset([data.terraform_remote_state.security_config.outputs.postgres_sg01_id]), null)
  key_name                    = var.key_name
  subnet_id                   = try(data.terraform_remote_state.network_config.outputs.db01_private_subnet_id, null)
  instance_profile_name       = var.instance_profile_name
  name                        = var.postgress01.name
  ami                         = var.postgress01.ami
  tool                        = var.postgress01.tool
  env                         = var.postgress01.env
  instance_type               = var.postgress01.instance_type
  associate_public_ip_address = var.postgress01.associate_public_ip
}
