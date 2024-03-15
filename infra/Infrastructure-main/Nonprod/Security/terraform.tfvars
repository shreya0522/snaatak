### variable for sg ###
env                 = "dev"

salary_sg     = [{ name = "salary01_sg", env = "dev" }, { name = "salary02_sg", env = "qa" }]
attendance_sg = [{ name = "attendance01_sg", env = "dev" }, { name = "attendance02_sg", env = "qa" }]
employee_sg   = [{ name = "employee01_sg", env = "dev" }, { name = "employee02_sg", env = "qa" }]
frontend_sg   = [{ name = "frontend01_sg", env = "dev" }, { name = "frontend02_sg", env = "qa" }]
redis_sg      = [{ name = "redis01_sg", env = "dev" }, { name = "redis02_sg", env = "qa" }]
postgres_sg   = [{ name = "postgres_sg01_sg", env = "dev" }, { name = "postgres_sg02_sg", env = "qa" }]
scylla_sg     = [{ name = "scylla01_sg", env = "dev" }, { name = "scylla02_sg", env = "qa" }]

alb_security_grp = {
  name = "alb_sg"
  env  = "dev"
  ingress = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["10.0.1.16/28"]
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
