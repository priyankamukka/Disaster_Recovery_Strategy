resource "aws_s3_bucket" "app_s3_bucket" {
  bucket = "example-bucket-name"

}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_s3_bucket_encryption" {
  bucket = aws_s3_bucket.app_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}



resource "aws_s3_bucket_acl" "app_s3_bucket_acl" {
  bucket = aws_s3_bucket.app_s3_bucket.id
  acl    = "private"
}
