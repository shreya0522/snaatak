#### EC2 instance configuration  ####
resource "aws_instance" "ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.instance_profile_name
  //EBS block device configuration
  root_block_device {
    volume_size = try(var.ebs_size, 8)
  }

  tags = {
    Name = var.name
    Tool = var.tool
    Env  = var.env
  }
}



# resource "aws_instance" "ec2_instance" {
#   ami                         = var.ami
#   instance_type               = var.instance_type
#   subnet_id                   = var.subnet_id
#   key_name                    = var.key_name
#   vpc_security_group_ids      = var.security_groups
#   associate_public_ip_address = var.associate_public_ip_address
#   iam_instance_profile        = var.instance_profile_name
#   tags = {
#     Name = var.name
#     Tool = var.tool
#     Env  = var.env
#   }
# }
