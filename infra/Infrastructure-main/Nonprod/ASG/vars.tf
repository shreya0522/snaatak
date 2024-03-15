
variable "instance_type" {
  type        = string
  description = "instance"
}

variable "key_dev" {
  type    = string
  default = "dev"
}

#####################asg########################
variable "max_size" {
  default     = "4"
  description = "max size"
}
variable "min_size" {
  default     = "2"
  description = "min size"
}
variable "dev_salary_desired_capacity" {
  default     = "2"
  description = "description size"
}
variable "asg_health_check_type" {
  default     = "EC2"
  description = "health check of instance"
}
variable "dev_asg" {
  default     = "dev"
  description = "security_group name"
}
variable "dev_asg_scale_up" {
  default = "dev_asg_scale_up"
}
variable "adjustment_type" {
  default = "ChangeInCapacity"
}
variable "scaling_adjustment" {
  default = "1"
}
variable "cooldown" {
  default = "300"
}
variable "policy_type" {
  default = "simple scaling"
}
variable "asg-scale-up-alarm" {
  default = "dev-scale-up"
}
variable "metric_name" {
  default = "120"
}
variable "threshold_value" {
  default = "30"
}

####################### scale down ############
variable "asg-scale-down" {
  default = "dev_asg_scale_down"
}
variable "adjustment_dev_type" {
  default = "ChangeInCapacity"
}
variable "dev_scaling_adjustment" {
  default = "-1"
}
variable "cooldown_period" {
  default = "300"
}
variable "dev_policy_type" {
  default = "SimpleScaling"
}
variable "asg-scale-down-alarm" {
  default = "asg-scale-down"
}
variable "cloudwatch_metric_name" {
  default = "CPUUtilization"
}
variable "ec2_threshold_value" {
  default = "5"
}

#### Salary ASG
variable "dev_salary_image_id" {
  type        = string
  description = "launch_ami"
}

##### Attendance ASG
variable "dev_attendance_image_id" {
  type        = string
  description = "launch_ami"
}

variable "user_data_attendance" {
  type = string
}

variable "dev_attendance_desired_capacity" {
  type = string
}

#### Employee ASG ##########
variable "dev_employee_image_id" {
  type        = string
  description = "launch_ami"
}
variable "dev_employee_desired_capacity" {

  default     = "1"
  description = "number of instances"
}
#### frontend ASG ##########
variable "dev_frontend_image_id" {
  type        = string
  description = "launch_ami"
}
variable "dev_frontend_desired_capacity" {
  default     = "1"
  description = "description size"
}