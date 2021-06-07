resource "random_string" "random_txt" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  number  = true
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "g33kzone-${random_string.random_txt.result}"
  acl    = "private"
  # enabled force_destroy for the demo purpose
  force_destroy = true

  # enable versioning
  versioning {
    enabled = true
  }
  lifecycle_rule {
    id      = "demo-transition"
    prefix  = "test"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "ONEZONE_IA"
    }
    transition {
      days          = 90
      storage_class = "GLACIER"
    }
    expiration {
      days = 120
    }
  }
}