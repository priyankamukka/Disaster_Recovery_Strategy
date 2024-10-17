# Create an IAM Role for EC2 to access S3
resource "aws_iam_role" "ec2_s3_role" {
  name        = var.ec2_s3_role_name
  description = var.ec2_s3_role_description

  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  
  managed_policy_arns = var.ec2_s3_managed_policy_arns
  path = var.ec2_s3_role_path
}

# Create an IAM Role for S3 to access AWS Backup
resource "aws_iam_role" "BackupS3AccessRole" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "backup.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  
  description = var.backup_s3_role_description
  managed_policy_arns = var.backup_s3_managed_policy_arns
  name = var.backup_s3_role_name
  path = var.backup_s3_role_path

  inline_policy {
    name = var.backup_s3_inline_policy_name
    policy = jsonencode(
      {
        Statement = [
          {
            Action = var.backup_s3_inline_policy_actions
            Effect   = "Allow"
            Resource = "*"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}
