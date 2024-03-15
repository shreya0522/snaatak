resource "aws_launch_template" "dev" {
  name          = var.dev
  image_id      = var.image_id
  instance_type = var.instance_type 
  key_name  = var.key_dev
#   user_data = filebase64("${path.module}/ec2-init.sh")
  vpc_security_group_ids = [var.dev_sg_id]
}

resource "aws_autoscaling_group" "dev_asg" {
  name                      = var.dev_asg
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = 300
  health_check_type         = var.asg_health_check_type
  vpc_zone_identifier = var.subnets

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances",
  ]

  metrics_granularity = "1Minute"

  launch_template {
    id      = aws_launch_template.dev.id
    version = aws_launch_template.dev.latest_version
    # version = aws_launch_template.jenkins_template.latest_version 
  }
}
resource "aws_autoscaling_policy" "scale_up" {
  name                   = var.dev_asg_scale_up
  autoscaling_group_name = aws_autoscaling_group.dev_asg.id
  adjustment_type        = var.adjustment_type
  scaling_adjustment     = var.scaling_adjustment #increasing instance by 1 
  cooldown               = var.cooldown
  policy_type            = var.policy_type
}

resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name          = var.asg-scale-up-alarm
  alarm_description   = "asg-scale-up-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = var.metric_name
  evaluation_periods  = "2"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.threshold_value # New instance will be created once CPU utilization is higher than 30 %
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.dev_asg.id
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_up.arn]
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = var.asg-scale-down
  autoscaling_group_name = aws_autoscaling_group.dev_asg.id
  adjustment_type        = var.adjustment_dev_type
  scaling_adjustment     = var.dev_scaling_adjustment# decreasing instance by 1 
  cooldown               = var.cooldown_period
  policy_type            = var.dev_policy_type
}

# scale down alarm
resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name          = var.asg-scale-down-alarm
  alarm_description   = "asg-scale-down-cpu-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         =  var.cloudwatch_metric_name
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.ec2_threshold_value # Instance will scale down when CPU utilization is lower than 5 %
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.dev_asg.id
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_down.arn]
}

