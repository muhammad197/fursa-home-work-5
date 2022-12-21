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


# Create an EC2 instance for each application server
resource "aws_instance" "app_server" {
  count          = var.c
  instance_type  = var.at
  ami            = "ami-0caef02b518350c8b"
  key_name         = "muhammad"

  user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt install -y httpd
                  sudo systemctl start httpd
                  sudo systemctl enable httpd
                  EOF
}
