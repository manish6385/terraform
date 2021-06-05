resource "aws_instance" "web" {
  instance_type = var.instance_type
  ami           = var.aws_web_ami
  availability_zone = var.availability_zone

  key_name = "terraform-key"

  tags = {
    "Name" = "aws-ec2-ebs-vol"
  }
}

resource "aws_ebs_volume" "ebs_vol_test" {
  availability_zone = "us-east-1a"
  size = 5
}

resource "aws_volume_attachment" "ebs_vol_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.ebs_vol_test.id
  instance_id = aws_instance.web.id
  depends_on = [ aws_ebs_volume.ebs_vol_test, aws_instance.web]
}