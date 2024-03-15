### Read ec2 config from ec2 statefile
data "terraform_remote_state" "ec2_config" {
  backend = "s3"

  config = {
    bucket         = "ot-microservise01"
    key            = "EC2/Prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod_network"
  }
}

### Read ec2 config from ec2 statefile
data "terraform_remote_state" "alb_config" {
  backend = "s3"

  config = {
    bucket         = "ot-microservise01"
    key            = "ALB/Prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod_network"
  }
}

### Read ec2 config from ec2 statefile
data "terraform_remote_state" "network_config" {
  backend = "s3"

  config = {
    bucket         = "ot-microservise01"
    key            = "Network/Prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod_network"
  }
}

module "route53_config" {
  source              = "git@github.com:OT-MyGurukulam/Route53_tf_module.git"
  public_domain_name  = var.public_domain_name
  private_domain_name = var.private_domain_name
  vpc_id              = data.terraform_remote_state.network_config.outputs.vpc_id
  environment         = var.environment
  private_records = {
    "postgres.opstree.com" = {
      type    = "A"
      ttl     = 300
      records = [data.terraform_remote_state.ec2_config.outputs.postgress01_private_ip]
    }
    "scylla.opstree.com" = {
      type    = "A"
      ttl     = 300
      records = [data.terraform_remote_state.ec2_config.outputs.scylla01_private_ip]
    }
    "redis.opstree.com" = {
      type    = "A"
      ttl     = 300
      records = [data.terraform_remote_state.ec2_config.outputs.redis01_private_ip]
    }
  }
  public_records = {}
  public_alias_records = {
    "dnishad.com" = {
      name    = data.terraform_remote_state.alb_config.outputs.name
      zone_id = data.terraform_remote_state.alb_config.outputs.zone_id
    }
  }
  private_alias_records = {}
}