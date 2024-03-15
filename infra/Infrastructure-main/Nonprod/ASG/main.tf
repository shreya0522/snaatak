
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

data "terraform_remote_state" "alb_config" {
  backend = "s3"

  config = {
    bucket         = "ot-microservise01"
    key            = "ALB/Nonprod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nonprod_network"
  }
}

### Salary asg config
module "dev_salary_asg" {
  source                 = "git@github.com:OT-MyGurukulam/ASG_tf_module.git"
  dev                    = "dev_salary_lt"
  image_id               = var.dev_salary_image_id
  instance_type          = var.instance_type
  key_dev                = var.key_dev
  dev_sg_id              = try(data.terraform_remote_state.security_config.outputs.salary_sg01_id, "demo")
  dev_asg                = "dev_salary_asg"
  max_size               = var.max_size
  min_size               = var.min_size
  desired_capacity       = var.dev_salary_desired_capacity
  asg_health_check_type  = var.asg_health_check_type
  subnets                = try(toset([data.terraform_remote_state.network_config.outputs.backend01_private_subnet_id]), null)
  dev_asg_scale_up       = var.dev_asg_scale_up
  adjustment_type        = var.adjustment_type
  scaling_adjustment     = var.scaling_adjustment
  cooldown               = var.cooldown
  policy_type            = var.policy_type
  asg-scale-up-alarm     = var.asg-scale-up-alarm
  metric_name            = var.metric_name
  threshold_value        = var.threshold_value
  asg-scale-down         = var.asg-scale-down
  adjustment_dev_type    = var.adjustment_dev_type
  dev_scaling_adjustment = var.dev_scaling_adjustment
  cooldown_period        = var.cooldown_period
  dev_policy_type        = var.dev_policy_type
  asg-scale-down-alarm   = var.asg-scale-down-alarm
  cloudwatch_metric_name = var.cloudwatch_metric_name
  ec2_threshold_value    = var.ec2_threshold_value
  target_group_arns      = try(tolist([data.terraform_remote_state.alb_config.outputs.tg_arn[0]]), null)
}

### Attendance asg config
module "dev_attendance_asg" {
  source                 = "git@github.com:OT-MyGurukulam/ASG_tf_module.git"
  dev                    = "dev_attendance_lt"
  image_id               = var.dev_attendance_image_id
  instance_type          = var.instance_type
  key_dev                = var.key_dev
  dev_sg_id              = try(data.terraform_remote_state.security_config.outputs.attendance_sg01_id, "demo")
  dev_asg                = "dev_attendance_asg"
  max_size               = var.max_size
  min_size               = var.min_size
  desired_capacity       = var.dev_attendance_desired_capacity
  asg_health_check_type  = var.asg_health_check_type
  subnets                = try(toset([data.terraform_remote_state.network_config.outputs.backend01_private_subnet_id]), null)
  dev_asg_scale_up       = var.dev_asg_scale_up
  adjustment_type        = var.adjustment_type
  scaling_adjustment     = var.scaling_adjustment
  cooldown               = var.cooldown
  policy_type            = var.policy_type
  asg-scale-up-alarm     = var.asg-scale-up-alarm
  metric_name            = var.metric_name
  threshold_value        = var.threshold_value
  asg-scale-down         = var.asg-scale-down
  adjustment_dev_type    = var.adjustment_dev_type
  dev_scaling_adjustment = var.dev_scaling_adjustment
  cooldown_period        = var.cooldown_period
  dev_policy_type        = var.dev_policy_type
  asg-scale-down-alarm   = var.asg-scale-down-alarm
  cloudwatch_metric_name = var.cloudwatch_metric_name
  ec2_threshold_value    = var.ec2_threshold_value
  user_data              = var.user_data_attendance
  target_group_arns      = try(tolist([data.terraform_remote_state.alb_config.outputs.tg_arn[1]]), null)
}

### Employee asg config
module "dev_employee_asg" {
  source                 = "git@github.com:OT-MyGurukulam/ASG_tf_module.git"
  dev                    = "dev_employee_lt"
  image_id               = var.dev_employee_image_id
  instance_type          = var.instance_type
  key_dev                = var.key_dev
  dev_sg_id              = try(data.terraform_remote_state.security_config.outputs.employee_sg01_id, "demo")
  dev_asg                = "dev_employee_asg"
  max_size               = var.max_size
  min_size               = var.min_size
  desired_capacity       = var.dev_employee_desired_capacity
  asg_health_check_type  = var.asg_health_check_type
  subnets                = try(toset([data.terraform_remote_state.network_config.outputs.backend01_private_subnet_id]), null)
  dev_asg_scale_up       = var.dev_asg_scale_up
  adjustment_type        = var.adjustment_type
  scaling_adjustment     = var.scaling_adjustment
  cooldown               = var.cooldown
  policy_type            = var.policy_type
  asg-scale-up-alarm     = var.asg-scale-up-alarm
  metric_name            = var.metric_name
  threshold_value        = var.threshold_value
  asg-scale-down         = var.asg-scale-down
  adjustment_dev_type    = var.adjustment_dev_type
  dev_scaling_adjustment = var.dev_scaling_adjustment
  cooldown_period        = var.cooldown_period
  dev_policy_type        = var.dev_policy_type
  asg-scale-down-alarm   = var.asg-scale-down-alarm
  cloudwatch_metric_name = var.cloudwatch_metric_name
  ec2_threshold_value    = var.ec2_threshold_value
  target_group_arns      = try(tolist([data.terraform_remote_state.alb_config.outputs.tg_arn[2]]), null)
}
####### frontend asg config ############
module "dev_frontend_asg" {
  source                 = "git@github.com:OT-MyGurukulam/ASG_tf_module.git"
  dev                    = "dev_frontend_lt"
  image_id               = var.dev_frontend_image_id
  instance_type          = var.instance_type
  key_dev                = var.key_dev
  dev_sg_id              = try(data.terraform_remote_state.security_config.outputs.frontend_sg_id, "demo")
  dev_asg                = "dev_frontend_asg"
  max_size               = var.max_size
  min_size               = var.min_size
  desired_capacity       = var.dev_frontend_desired_capacity
  asg_health_check_type  = var.asg_health_check_type
  subnets                = try(toset([data.terraform_remote_state.network_config.outputs.backend01_private_subnet_id]), null)
  dev_asg_scale_up       = var.dev_asg_scale_up
  adjustment_type        = var.adjustment_type
  scaling_adjustment     = var.scaling_adjustment
  cooldown               = var.cooldown
  policy_type            = var.policy_type
  asg-scale-up-alarm     = var.asg-scale-up-alarm
  metric_name            = var.metric_name
  threshold_value        = var.threshold_value
  asg-scale-down         = var.asg-scale-down
  adjustment_dev_type    = var.adjustment_dev_type
  dev_scaling_adjustment = var.dev_scaling_adjustment
  cooldown_period        = var.cooldown_period
  dev_policy_type        = var.dev_policy_type
  asg-scale-down-alarm   = var.asg-scale-down-alarm
  cloudwatch_metric_name = var.cloudwatch_metric_name
  ec2_threshold_value    = var.ec2_threshold_value
  target_group_arns      = try(tolist([data.terraform_remote_state.alb_config.outputs.tg_arn[3]]), null)
}
