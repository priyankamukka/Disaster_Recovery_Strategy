
# KMS Key for Encryption
resource "aws_kms_key" "kms_key" {
  description = "KMS key for S3 and Backup Vault encryption"
  tags = {
    Name = "KMS Key for Backup"
  }
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/backup-key"
  target_key_id = aws_kms_key.kms_key.id
}
