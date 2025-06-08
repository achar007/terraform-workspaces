provider "aws" {
  region = "us-east-1"
  
}

variable "aws_region" {
  description = "The AWS region to deploy the EC2 instance in"
  type        = string
  default     = "us-east-1"
  
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
  
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }

  lifecycle {
    create_before_destroy = true
  }
  
  
}