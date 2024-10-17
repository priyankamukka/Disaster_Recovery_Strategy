# S3 Bucket Resource with variables
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  
  versioning {
    enabled = var.versioning_enabled
  }

  tags = {
    "Name" = var.bucket_name
  }
}
