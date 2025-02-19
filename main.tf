provider "aws" {
region = "us-east-1"
ACCESS_KEY = 'tfu'
SECRET_KEY = 'wUDp[92!'
}

resource "aws_instance" "one" {
  ami             = "ami-053a45fff0a704a4"
  instance_type   = "t2.micro"
  key_name        = "keypair2"
  vpc_security_group_ids = [aws_security_group.five.id]
  availability_zone = "us-east-1"
  availability_zone = "us-east-1"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my app created by terraform infrastructurte by naveen dev server-1" > /var/www/html/index.html
EOF
  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "two" {
  ami             = "ami-053a45fff0a704a4"
  instance_type   = "t2.micro"
  key_name        = "keypair2"
  vpc_security_group_ids = [aws_security_group.five.id]
  availability_zone = "ap-southeast-1b"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by naveen test server-2" > /var/www/html/index.html
EOF
  tags = {
    Name = "web-server-2"
  }
}

resource "aws_security_group" "five" {
  name = "elb-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_s3_bucket" "six" {
  bucket = "serverbucket9988oo9988"
}
