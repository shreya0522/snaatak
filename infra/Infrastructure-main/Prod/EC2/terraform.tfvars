### variable for EC2 ###
key_name              = "MyGurukulam"   //"mgnt_key"
instance_profile_name = "Attendence_API"
scylla_ebs_size = 30

redis01 = {
  name                = "redis"
  associate_public_ip = true
  instance_type       = "t2.micro"
  tool                = "redis"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "prod"
}
redis02 = {
  name                = "redis"
  associate_public_ip = true
  instance_type       = "t2.micro"
  tool                = "redis"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "prod"
}

scylla01 = {
  name                = "scylla"
  associate_public_ip = true
  instance_type       = "t2.medium"
  tool                = "scylla"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "prod"
}
scylla02 = {
  name                = "scylla"
  associate_public_ip = true
  instance_type       = "t2.medium"
  tool                = "scylla"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "prod"
}

postgress01 = {
  name                = "postgress"
  associate_public_ip = true
  instance_type       = "t2.micro"
  tool                = "postgress"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "prod"
}
postgress02 = {
  name                = "postgress"
  associate_public_ip = true
  instance_type       = "t2.micro"
  tool                = "postgress"
  api                 = null
  ami                 = "ami-0c7217cdde317cfec"
  env                 = "prod"
}