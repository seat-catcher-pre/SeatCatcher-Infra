resource "aws_s3_bucket" "s3" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = "Terraform state storage"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.s3.id

  versioning_configuration {
    status = "Enabled"
  }
}