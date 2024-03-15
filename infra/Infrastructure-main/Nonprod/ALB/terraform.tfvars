alb_name                  = ["nonprod-alb"]
create_https_listener     = false
ssl_cert_arn              = ""
ssl_policy_name           = ""
tg_name                   = ["salary-tg", "attendance-tg", "employee-tg", "frontend-tg"]
health_check_path         = ["/api/v1/salary/actuator/health", "/api/v1/attendance/health", "/api/v1/employee/health", "/"]
tg_port                   = ["8080", "8080", "8080", "80"]

rules = [
  {
    priority     = 1
    host_header  = ["dev.dnishad.com"]
    path_pattern =  ["/api/v1/salary/*"]
  },
  {
    priority     = 2
    path_pattern = ["/api/v1/attendance/*"]
    host_header  = ["dev.dnishad.com"]
  },
  {
    priority     = 3
    path_pattern = ["/api/v1/employee/*"]
    host_header  = ["dev.dnishad.com"]
  },
  {
    priority     = 4
    path_pattern = ["/"]
    host_header  = ["dev.dnishad.com"]
  }
]

















