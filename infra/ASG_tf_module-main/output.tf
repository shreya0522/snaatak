output "launch_template_id" {
  value = aws_launch_template.dev.id
}

output "launch_template_latest_version" {
  value = aws_launch_template.dev.latest_version
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.dev_asg.id
}

output "autoscaling_group_arn" {
  value = aws_autoscaling_group.dev_asg.arn
}

output "scale_up_policy_arn" {
  value = aws_autoscaling_policy.scale_up.arn
}

output "scale_down_policy_arn" {
  value = aws_autoscaling_policy.scale_down.arn
}



