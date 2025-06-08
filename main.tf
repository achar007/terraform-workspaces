provider "aws" {
  region = "us-east-1"
  
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

module "ExampleInstance" {
  source        = "./modules/ec2_instance"
  ami_id       = var.ami_id
  instance_type = var.instance_type
  
}