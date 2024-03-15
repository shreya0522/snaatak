public_domain_name  = "dnishad.com"
private_domain_name = "opstree.com"
vpc_id              = "vpc-0c63148c111300458"
environment         = "prod"

# private_records = {
#   "dev-redis" = {
#     type    = "A"
#     ttl     = 300
#     records = ["10.0.0.1"]
#   }
#   "dev-scylla" = {
#     type    = "A"
#     ttl     = 300
#     records = ["10.0.0.1"]
#   }
#   "dev-postgres" = {
#     type    = "A"
#     ttl     = 300
#     records = ["10.0.0.1"]
#   }
#   "qa-redis" = {
#     type    = "A"
#     ttl     = 300
#     records = ["10.0.0.1"]
#   }
#   "qa-scylla" = {
#     type    = "A"
#     ttl     = 300
#     records = ["10.0.0.1"]
#   }
#   "qa-postgres" = {
#     type    = "A"
#     ttl     = 300
#     records = ["10.0.0.1"]
#  
# }

public_alias_records = {
  "dev.dnishad.com" = {
    name    = "nonprod-alb-1970103018.ap-south-1.elb.amazonaws.com"
    zone_id = "ZP97RAFLXTNZK"
  }
}