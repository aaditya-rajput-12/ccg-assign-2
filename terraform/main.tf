terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"

    }

  }

}

provider "aws"{
  region = var.aws_region
}

resource "aws_security_group" "web_sg" {

  name = "web-security-group"

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
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

resource "aws_instance" "web_server" {

  ami           = var.ami_id
  instance_type = var.instance_type

  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "web-server"
  }

}