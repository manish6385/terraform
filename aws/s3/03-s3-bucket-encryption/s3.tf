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

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3_kms_encrypt.arn
      }
      # S3 bucket keys reduce the cost of S3 server side encryption using AWS KMS
      # This bucket level key for SSE can reduce cost upto 99% by reducing the traffice to KMS
      bucket_key_enabled = true
    }
  }
}

resource "aws_kms_key" "s3_kms_encrypt" {
  description             = "KMS key used to encrypt S3 bucket objects"
  deletion_window_in_days = 10
}