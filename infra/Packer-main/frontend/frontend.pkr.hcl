packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

data "amazon-ami" "ubuntu-server" {
    region = "ap-south-1"
    filters = {
        virtualization-type = "hvm"
        name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
        root-device-type = "ebs"
    }
    owners = ["099720109477"]
    most_recent = true
}


source "amazon-ebs" "frontend" {
  region       = "ap-south-1"
  source_ami = data.amazon-ami.ubuntu-server.id
  instance_type = "t2.medium"
  ssh_username = "ubuntu"
  ami_name = "frontend"
}


build {
  sources = [ "source.amazon-ebs.frontend" ]

  provisioner "file" {
    source = "./frontend.zip"
    destination = "/home/ubuntu/frontend.zip"
  }

  provisioner "shell" {
    script = "./frontend/provision.sh"
  }

}