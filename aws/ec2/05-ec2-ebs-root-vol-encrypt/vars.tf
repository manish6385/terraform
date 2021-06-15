variable "region" {
  type    = string
  default = "us-east-1"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "aws_web_ami" {
  type        = string
  description = "EC2 AMI for Web Instance"
  default     = "ami-04d29b6f966df1537"
}