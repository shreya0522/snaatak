variable "public_domain_name" {
  type        = string
  default     = "dnishad.com"
  description = "The domain name for the public hosted zone"
}

variable "private_domain_name" {
  type        = string
  default     = "opstree.com"
  description = "The domain name for the private hosted zone"
}

variable "private_records" {
  description = "A map of DNS records for the private hosted zone"
  type        = map(any)
  default = {
    "internal-app" = {
      type    = "A"
      ttl     = 300
      records = ["10.0.0.1"]
    }
    "external-app" = {
      type    = "A"
      ttl     = 300
      records = ["10.0.0.1"]
    }
  }
}

variable "public_records" {
  description = "A map of DNS records for the public hosted zone"
  type        = map(any)
  # default = {
  #   "dnishad04.com" = {
  #     type    = "A"
  #     ttl     = 300
  #     records = ["10.0.0.2"]
  #   }
  # }
}

variable "public_alias_records" {
  description = "A map of DNS alias records for the public hosted zone"
  type        = map(any)
  # default = {
  #   "dev.dnishad.com" = {
  #     name    = "nonprod-alb-1970103018.ap-south-1.elb.amazonaws.com"
  #     zone_id = "ZP97RAFLXTNZK"
  #   }
  # }
}

variable "private_alias_records" {
  description = "A map of DNS alias records for the public hosted zone"
  type        = map(any)
  # default = {
  #   "dev.mygurukulam.com" = {
  #     name    = "nonprod-alb-1970103018.ap-south-1.elb.amazonaws.com"
  #     zone_id = "ZP97RAFLXTNZK"
  #   }
  # }
}

variable "vpc_id" {
  type        = string
  # default     = "vpc-0808ca67b26a91291"
  description = "VPC for private hosted zone"
}

variable "environment" {
  type        = string
  default     = "prod"
  description = "Environment for resources"
}