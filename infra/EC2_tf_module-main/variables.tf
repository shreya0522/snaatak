variable "security_groups" {
  type        = set(string)
  description = "Ec2 instance security group"
  default     = ["sg-05b424c1c03091db0"]
}

variable "key_name" {
  type        = string
  description = "Keypair for instance"
  default     = "MyGurukulam"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-013f88c0e2b1cefd6"
  description = "Subnet for instance"
}

variable "instance_profile_name" {
  type        = string
  description = "Ec2 instance profile"
  default     = "Attendence_API"
}

variable "ebs_size" {
  description = "Size of the root EBS volume in gibibytes"
  type        = number
  default     = 8   //Set a default value 
}

variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "tool" {
  type = string
}

variable "env" {
  type = string
}

variable "name" {
  type = string
}
