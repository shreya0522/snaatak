#### ec2 variable ####
variable "key_name" {
  type        = string
  description = "Keypair for instance"
}

variable "instance_profile_name" {
  type        = string
  description = "Ec2 instance profile"
}

variable "redis01" {
  description = "Ec2 instances attributes"
  type = object({
    name                = string
    associate_public_ip = bool
    tool                = string
    instance_type       = string
    api                 = string
    ami                 = string
    env                 = string
  })
}
variable "redis02" {
  description = "Ec2 instances attributes"
  type = object({
    name                = string
    associate_public_ip = bool
    tool                = string
    instance_type       = string
    api                 = string
    ami                 = string
    env                 = string
  })
}

variable "scylla01" {
  description = "Ec2 instances attributes"
  type = object({
    name                = string
    associate_public_ip = bool
    tool                = string
    instance_type       = string
    api                 = string
    ami                 = string
    env                 = string
  })
}
variable "scylla02" {
  description = "Ec2 instances attributes"
  type = object({
    name                = string
    associate_public_ip = bool
    tool                = string
    instance_type       = string
    api                 = string
    ami                 = string
    env                 = string
  })
}

variable "postgress01" {
  description = "Ec2 instances attributes"
  type = object({
    name                = string
    associate_public_ip = bool
    tool                = string
    instance_type       = string
    api                 = string
    ami                 = string
    env                 = string
  })
}
variable "postgress02" {
  description = "Ec2 instances attributes"
  type = object({
    name                = string
    associate_public_ip = bool
    tool                = string
    instance_type       = string
    api                 = string
    ami                 = string
    env                 = string
  })
}

variable "scylla_ebs_size" {
  description = "Size of the root EBS volume in gibibytes"
  type        = number
  default     = 8 //Set a default value 
}
