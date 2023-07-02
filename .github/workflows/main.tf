provider "aws" {
  region = "ap-northeast-1"
  # Edit below
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "jason-webserver-1" {
  ami           = "ami-0fc61db8544a617ed"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  key_name = "jason-accesskeys-miniproject"
  associate_public_ip_address = true
  subnet_id = "vpc-09ccea841ba7faab9"
  vpc_security_group_ids = "sg-03bdb93bf7309cdc8"

  tags = {
    Name = "jason-webserver-1"
  }
}


resource "aws_instance" "jason-webserver-2" {
  ami           = "ami-0fc61db8544a617ed"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  key_name = "jason-accesskeys-miniproject"
  associate_public_ip_address = true
  subnet_id = "vpc-09ccea841ba7faab9"
  vpc_security_group_ids = "sg-03bdb93bf7309cdc8"

  tags = {
    Name = "jason-webserver-2"
  }
}


resource "aws_instance" "jason-Ansibleserver" {
  ami           = "ami-0fc61db8544a617ed"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  key_name = "jason-accesskeys-miniproject"
  associate_public_ip_address = true
  subnet_id = "vpc-09ccea841ba7faab9"
  vpc_security_group_ids = "sg-03bdb93bf7309cdc8"

  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install pip -y
  sudo python3 -m pip install --user ansible
  EOF

  tags = {
    Name = "jason-Ansibleserver"
  }
}