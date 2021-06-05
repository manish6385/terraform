resource "aws_instance" "web" {
  instance_type = var.instance_type
  ami           = var.aws_web_ami

  key_name = "terraform-key"

  tags = {
    "Name" = "aws-ec2-basic-temp"
  }
}