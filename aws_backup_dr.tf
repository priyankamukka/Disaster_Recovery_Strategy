
# Backup Vault in a Different Region (for DR) with KMS Encryption
provider "aws" {
  alias  = "dr"
  region = "ap-south-1"
}

resource "aws_backup_vault" "dr_vault" {
  provider    = aws.dr
  name        = "dr-backup-vault"
  kms_key_arn = aws_kms_key.kms_key.arn
  tags = {
    Name = "DR Backup Vault"
  }
}

