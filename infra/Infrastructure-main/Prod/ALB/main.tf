data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "ot-microservise01"
    key    = "Network/Prod/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "ot-microservise01"
    key    = "Security/Prod/terraform.tfstate"
    region = "us-east-1"
  }
}

module "alb" {
  source                = "git@github.com:OT-MyGurukulam/ALB_Module.git"
  alb_name              = var.alb_name
  alb_subnets           = try([data.terraform_remote_state.network.outputs.public01_subnet_id, data.terraform_remote_state.network.outputs.public02_subnet_id], [""])
  alb_security_groups   = try([data.terraform_remote_state.sg.outputs.alb_sg_id], [""])
  env                   = "prod"
  tg_name               = var.tg_name
  tg_port               = var.tg_port
  health_check_path     = var.health_check_path
  vpc_id                = try(data.terraform_remote_state.network.outputs.vpc_id, "")
  create_https_listener = var.create_https_listener
  ssl_cert_arn          = var.ssl_cert_arn
  ssl_policy_name       = var.ssl_policy_name
  rules                 = var.rules
}
