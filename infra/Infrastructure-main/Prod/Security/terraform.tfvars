### variable for sg ###
env                 = "prod"

salary_sg     = [{ name = "salary01_sg", env = "prod" }, { name = "salary02_sg", env = "prod" }]
attendance_sg = [{ name = "attendance01_sg", env = "prod" }, { name = "attendance02_sg", env = "prod" }]
employee_sg   = [{ name = "employee01_sg", env = "prod" }, { name = "employee02_sg", env = "prod" }]
frontend_sg   = [{ name = "frontend01_sg", env = "prod" }, { name = "frontend02_sg", env = "prod" }]
redis_sg      = [{ name = "redis01_sg", env = "prod" }, { name = "redis02_sg", env = "prod" }]
postgres_sg   = [{ name = "postgres_sg01_sg", env = "prod" }, { name = "postgres_sg02_sg", env = "prod" }]
scylla_sg     = [{ name = "scylla01_sg", env = "prod" }, { name = "scylla02_sg", env = "prod" }]

alb_security_grp = {
  name = "alb_sg"
  env  = "prod"
  ingress = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
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
