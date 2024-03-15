variable "alb_security_grp" {
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
}

variable "env" {
  type        = string
  description = "Environment"
}
variable "salary_sg" {
  type = list(object({
    name = string
    env  = string
  }))
  description = "salary security groups"
}
variable "attendance_sg" {
  type = list(object({
    name = string
    env  = string
  }))
  description = "attendance security groups"
}
variable "employee_sg" {
  type = list(object({
    name = string
    env  = string
  }))
  description = "employee security groups"
}
variable "frontend_sg" {
  type = list(object({
    name = string
    env  = string
  }))
  description = "frontend security groups"
}
variable "redis_sg" {
  type = list(object({
    name = string
    env  = string
  }))
  description = "redis security groups"
}
variable "scylla_sg" {
  type = list(object({
    name = string
    env  = string
  }))
  description = "scylla security groups"
}
variable "postgres_sg" {
  type = list(object({
    name = string
    env  = string
  }))
  description = "postgres security groups"
}

