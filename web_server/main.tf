terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws"{
    
    region     = var.Zone
}


resource "aws_security_group" "Hello-terra-ssh-http" {
  name        = "hello-terra-ssh-http"
  description = "allowing ssh and http"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      =  ["0.0.0.0/0"]
    
  }
    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      =  ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "web_server" {
  count             = 4
  ami               = var.AmiName
  instance_type     = var.InstenceType
  security_groups   = [aws_security_group.Hello-terra-ssh-http.id]
  key_name = "muhammad"
  user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo systemctl start httpd
                  sudo systemctl enable httpd
                  echo "<h1>Web Server using Terrafrom </h1> >>/var/www/html/index.html
                  EOF
}