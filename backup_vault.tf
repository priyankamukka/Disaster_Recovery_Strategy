# AWS Backup Plan and Vault (with KMS Encryption)
resource "aws_backup_vault" "primary_vault" {
  name        = "primary-backup-vault"
  kms_key_arn = aws_kms_key.kms_key.arn
  tags = {
    Name = "Primary Backup Vault"
  }
}

resource "aws_iam_role" "backup_role" {
  name = "AWSBackupDefaultRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "backup_policy" {
  name = "AWSBackupPolicy"
  role = aws_iam_role.backup_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeVolumes",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot",
          "ec2:DescribeSnapshots",
          "s3:GetBucketLocation",
          "s3:ListAllMyBuckets",
          "backup:StartBackupJob",
          "backup:StopBackupJob",
          "backup:CreateBackupVault",
          "backup:DeleteBackupVault",
          "backup:DescribeBackupVault",
          "backup:ListBackupVaults",
          "backup:GetBackupVaultNotifications",
          "backup:PutBackupVaultNotifications",
          "backup:StartRestoreJob",
          "backup:DescribeProtectedResource",
          "backup:ListProtectedResources"
        ],
        Resource = "*"
      }
    ]
  })
}
