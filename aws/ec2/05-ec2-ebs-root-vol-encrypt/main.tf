resource "aws_instance" "web" {
  instance_type     = var.instance_type
  ami               = var.aws_web_ami
  availability_zone = var.availability_zone

# root volume encrypted via CMK key
  root_block_device {
    encrypted             = true
    volume_size           = "10"
    volume_type           = "gp2"
    delete_on_termination = true
    kms_key_id            = aws_kms_key.cmk_kms_key.key_id
  }

  tags = {
    "Name" = "aws-ec2-demo"
  }
}

# Additional EBS Volume encrypted via CMK key
resource "aws_ebs_volume" "ebs_vol_add" {
  availability_zone = "us-east-1a"
  size              = 5
  encrypted             = true
  kms_key_id        = aws_kms_key.cmk_kms_key.arn
}

resource "aws_volume_attachment" "ebs_vol_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.ebs_vol_add.id
  instance_id = aws_instance.web.id
}

# AWS Volumes encryption via Customer Managed CMK Key
# Supports - SYMMETRIC_DEFAULT / RSA_2048 / RSA_3072 / RSA_4096
resource "aws_kms_key" "cmk_kms_key" {
  description              = "Customer Managed KMS Key"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
}