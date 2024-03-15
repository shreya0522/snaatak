packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "employee_AMI_Packer"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "build employee_AMI"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
      scripts = [
          "employee.sh"
      ]
       }
}
