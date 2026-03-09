variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-019715e0d74f695be"
}

variable "instance_type" {
  default = "t3.micro"
}


variable "ssh_port" {
  default = 22
}

variable "http_port" {
  default = 80
}

variable "https_port" {
  default = 443
}

variable "app_port" {
  default = 90
}

