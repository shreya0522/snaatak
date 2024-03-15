packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

data "amazon-ami" "ubuntu-server" {
    region = "us-east-1"
    filters = {
        virtualization-type = "hvm"
        name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
        root-device-type = "ebs"
    }
    owners = ["099720109477"]
    most_recent = true
}

source "amazon-ebs" "salary" {
  region       = "us-east-1"
  source_ami = data.amazon-ami.ubuntu-server.id
  instance_type = "t2.medium"
  ssh_username = "ubuntu"
  ami_name = "salary-v1.0"
  tags = {
    app = "salary-v1.0"
  }
}


build {
  sources = [ "source.amazon-ebs.salary" ]

  provisioner "file" {
    source = "./target/salary-0.1.0-RELEASE.jar"
    destination = "/home/ubuntu/salary-0.1.0-RELEASE.jar"
  }

   provisioner "file" {
    source = "./salary/application.yml"
    destination = "/home/ubuntu/application.yml"
  }

  provisioner "file" {
    source = "./salary/salary.service"
    destination = "/tmp/salary.service"
  }

  provisioner "shell" {
    script = "./salary/provision.sh"
  }

}