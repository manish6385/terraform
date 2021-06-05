# "aws_ami" data source is used to get ID of a registered AMI for use in other resources.
data "aws_ami" "amzn2-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.2020*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  owners = ["amazon"]
}


resource "aws_instance" "web" {
  instance_type = var.instance_type
  # "aws_ami" Data Source referred while creating AWS EC2 Instance
  ami = data.aws_ami.amzn2-ami.id

  key_name = "terraform-key"

  tags = {
    "Name" = "aws-ec2-user-data-nginx"
  }

  user_data = "${file("install_dependency.sh")}"
}
