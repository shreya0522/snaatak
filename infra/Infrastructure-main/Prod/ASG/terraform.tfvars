##### ASG Common
# image_id              = "ami-0c3878e4d4556080f"
instance_type         = "t2.micro"
key_dev               = "MyGurukulam" //"mgnt_key" //"MyGurukulam"
dev_asg               = "dev_salary_asg"
max_size              = 2
min_size              = 1
asg_health_check_type = "EC2"
dev_asg_scale_up      = "prod_asg_scale_up"
adjustment_type       = "ChangeInCapacity"
scaling_adjustment    = "1"
cooldown              = "300"
policy_type           = "SimpleScaling"
asg-scale-up-alarm    = "prod_asg_scale_up"
metric_name           = "CPUUtilization"
threshold_value       = "50"
################## scale down ##################
asg-scale-down         = "prod_asg_scale_up"
adjustment_dev_type    = "ChangeInCapacity"
dev_scaling_adjustment = "1"
cooldown_period        = "300"
dev_policy_type        = "SimpleScaling"
asg-scale-down-alarm   = "prod_asg_scale_up"
cloudwatch_metric_name = "CPUUtilization"
ec2_threshold_value    = "5"

### Dev Salary ASG
salary_desired_capacity = 1
salary_image_id         =  "ami-0b615dd19ed960ac7" //"ami-053a3af0bfa4c3f7a" //"ami-0b615dd19ed960ac7"

### Dev attendance ASG 
attendance_desired_capacity = 1
attendance_image_id         = "ami-0aa001b8d8c88066f" //"ami-01a64d9defdd42683" //"ami-0aa001b8d8c88066f"

### Dev Employee ASG
employee_desired_capacity = 1
employee_image_id         = "ami-0ba616868b42d2964" //"ami-001e39e6c047f0980" //"ami-0ba616868b42d2964"

### Dev frontend ASG #########
frontend_desired_capacity = 1
frontend_image_id         = "ami-0c8fce6a377492042" //"ami-0f4f2c7277140d335" //"ami-0c8fce6a377492042"


