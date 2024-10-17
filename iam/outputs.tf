output "ec2_s3_role_arn" {
  description = "The ARN of the IAM Role for EC2 to access S3"
  value       = aws_iam_role.ec2_s3_role.arn
}

output "backup_s3_role_arn" {
  description = "The ARN of the IAM Role for Backup to access S3"
  value       = aws_iam_role.BackupS3AccessRole.arn
}
