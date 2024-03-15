####### ALB

variable "alb_name" {
  type = list(string)
}

variable "tg_name" {
  type = list(string)
}

variable "create_https_listener" {
  type = bool
}

variable "ssl_cert_arn" {
  type = string
}

variable "ssl_policy_name" {
  type = string
}

variable "tg_port" {
  type = list(string)
}


variable "rules" {
  type = list(object({
    priority     = number
    path_pattern = list(string)
    host_header  = list(string)
  }))
}

variable "health_check_path" {
  type = list(string)
}
