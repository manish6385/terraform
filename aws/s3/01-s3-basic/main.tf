resource "aws_s3_bucket" "s3-data-bucket" {
  bucket = "g33kzone-s3-test-bucket"
  acl = "private"
}