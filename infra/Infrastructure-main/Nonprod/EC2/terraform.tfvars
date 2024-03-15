### variable for EC2 ###
key_name              = "MyGurukulam"
instance_profile_name = "Attendence_API"

redis01 = {
  name                = "dev_redis"
  associate_public_ip = true
  instance_type       = "t2.micro"
  tool                = "redis"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "dev"
}

scylla01 = {
  name                = "dev_scylla"
  associate_public_ip = true
  instance_type       = "t2.medium"
  tool                = "scylla"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "dev"
}

postgress01= {
  name                = "dev_postgress"
  associate_public_ip = true
  instance_type       = "t2.micro"
  tool                = "postgress"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "dev"
}
