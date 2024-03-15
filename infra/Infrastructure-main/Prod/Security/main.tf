data "terraform_remote_state" "network_config" {
  backend = "s3"

  config = {
    bucket         = "ot-microservise01"
    key            = "Network/Prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod_network"
  }
}

### Salary security group
module "salary_sg" {
  source = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  count  = length(var.salary_sg)
  security_grp = {

    name = var.salary_sg[count.index].name
    env  = var.salary_sg[count.index].env
    ingress = [
      { from_port = 8080, to_port = 8080, protocol = "tcp", cidr_blocks = null, sg_id = module.alb_security_group.security_group_id },
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
  vpc_id = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}
### Attendance security group
module "attendance_sg" {
  source = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  count  = length(var.attendance_sg)
  security_grp = {

    name = var.attendance_sg[count.index].name
    env  = var.attendance_sg[count.index].env
    ingress = [
      { from_port = 8080, to_port = 8080, protocol = "tcp", cidr_blocks = null, sg_id = module.alb_security_group.security_group_id },
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
  vpc_id = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}

### Employee security group
module "employee_sg" {
  source = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  count  = length(var.employee_sg)
  security_grp = {

    name = var.employee_sg[count.index].name
    env  = var.employee_sg[count.index].env
    ingress = [
      { from_port = 8080, to_port = 8080, protocol = "tcp", cidr_blocks = null, sg_id = module.alb_security_group.security_group_id },
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
  vpc_id = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}

### frontend security group
module "frontend_sg" {
  source = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  count  = length(var.frontend_sg)
  security_grp = {

    name = var.frontend_sg[count.index].name
    env  = var.frontend_sg[count.index].env
    ingress = [
      { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = null, sg_id = module.alb_security_group.security_group_id },
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
  vpc_id = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}

### redis security group
module "redis_sg" {
  source = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  count  = length(var.redis_sg)
  security_grp = {

    name = var.redis_sg[count.index].name
    env  = var.redis_sg[count.index].env
    ingress = [
      { from_port = 6349, to_port = 6349, protocol = "tcp", cidr_blocks = null, sg_id = module.salary_sg[count.index].security_group_id },
      { from_port = 6349, to_port = 6349, protocol = "tcp", cidr_blocks = null, sg_id = module.attendance_sg[count.index].security_group_id },
      { from_port = 6349, to_port = 6349, protocol = "tcp", cidr_blocks = null, sg_id = module.employee_sg[count.index].security_group_id },
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null },
      { from_port = 6349, to_port = 6349, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
  vpc_id = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}

### scylla security group
module "scylla_sg" {
  source = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  count  = length(var.scylla_sg)
  security_grp = {

    name = var.scylla_sg[count.index].name
    env  = var.scylla_sg[count.index].env
    ingress = [
      { from_port = 9042, to_port = 9042, protocol = "tcp", cidr_blocks = null, sg_id = module.salary_sg[count.index].security_group_id },
      { from_port = 9042, to_port = 9042, protocol = "tcp", cidr_blocks = null, sg_id = module.employee_sg[count.index].security_group_id },
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null },
      { from_port = 9042, to_port = 9042, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
  vpc_id = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}

### postgres security group
module "postgres_sg" {
  source = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  count  = length(var.postgres_sg)
  security_grp = {
    name = var.postgres_sg[count.index].name
    env  = var.postgres_sg[count.index].env
    ingress = [
      { from_port = 5432, to_port = 5432, protocol = "tcp", cidr_blocks = null, sg_id = module.attendance_sg[count.index].security_group_id },
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null },
      { from_port = 5432, to_port = 5432, protocol = "tcp", cidr_blocks = ["10.0.0.0/26"], sg_id = null }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
  vpc_id = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}
### ALB security group
module "alb_security_group" {
  source       = "git@github.com:OT-MyGurukulam/EC2_tf_module.git?ref=security_group"
  security_grp = var.alb_security_grp
  vpc_id       = try(data.terraform_remote_state.network_config.outputs.vpc_id, null)
}
