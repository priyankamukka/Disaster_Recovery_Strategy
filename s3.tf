# S3 Bucket for Storage with KMS Encryption
resource "aws_s3_bucket" "app_s3_bucket" {
  bucket = "app-backup-storage-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.kms_key.arn
      }
    }
  }

  tags = {
    Name = "app-backup-storage"
  }
}