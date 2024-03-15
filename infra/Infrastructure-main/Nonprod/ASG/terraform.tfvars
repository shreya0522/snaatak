##### ASG Common
# image_id              = "ami-0c3878e4d4556080f"
instance_type         = "t2.micro"
key_dev               = "MyGurukulam"
dev_asg               = "dev_salary_asg"
max_size              = 2
min_size              = 1
asg_health_check_type = "EC2"
dev_asg_scale_up      = "dev_asg_scale_up"
adjustment_type       = "ChangeInCapacity"
scaling_adjustment    = "1"
cooldown              = "300"
policy_type           = "SimpleScaling"
asg-scale-up-alarm    = "dev_asg_scale_up"
metric_name           = "CPUUtilization"
threshold_value       = "60"
################## scale down ##################
asg-scale-down         = "dev_asg_scale_up"
adjustment_dev_type    = "ChangeInCapacity"
dev_scaling_adjustment = "1"
cooldown_period        = "300"
dev_policy_type        = "SimpleScaling"
asg-scale-down-alarm   = "dev_asg_scale_up"
cloudwatch_metric_name = "CPUUtilization"
ec2_threshold_value    = "5"

### Dev Salary ASG
dev_salary_desired_capacity = 1
dev_salary_image_id         = "ami-0c7217cdde317cfec"

### Dev attendance ASG 
dev_attendance_desired_capacity = 1
dev_attendance_image_id         = "ami-0c7217cdde317cfec"

user_data_attendance = <<EOF
#!/bin/bash
# Define the file path
file_path=/home/ubuntu/attendance-api/config.yaml
# Define the old and new values
old_value="10.0.1.38"
new_value="dev.scylladb.opstree.com"
old_value1="10.0.1.40"
new_value1="dev.redis.opstree.com"
sed -i "s/$old_value/$new_value/g" "$file_path" 
sed -i "s/$old_value1/$new_value1/g" "$file_path"
sudo systemctl restart attendance.service
EOF

### Dev Employee ASG
dev_employee_desired_capacity = 1
dev_employee_image_id         = "ami-0c7217cdde317cfec"

### Dev frontend ASG #########
dev_frontend_desired_capacity = 1
dev_frontend_image_id         = "ami-05754433adeb00b1e"


