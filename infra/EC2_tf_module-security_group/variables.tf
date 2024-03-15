variable "security_grp" {
  type = object({
    name = string
    env  = string

    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      sg_id       = string

    }))

    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)

    }))

  })

  default = {
    name = "dev_frontend_sg"
    env  = "dev"
    ingress = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = null
        sg_id       = "sg-019c601f0af34b5fb"
        # cidr_blocks = ["10.0.0.0/28"]
      },
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/28"]
        sg_id       = null
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}


variable "vpc_id" {
  description = "Name of the VPC ID"
  type        = string
  default     = "vpc-062f1b8ae6c496abd"
}

variable "security_group_id" {
  description = "Name of the VPC ID"
  type        = string
  default     = "sg-053880e8c9e7a37f6"
  # default = ""
}