# SNS for Backup Notifications
resource "aws_sns_topic" "backup_sns_topic" {
  name = "backup-notifications"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.backup_sns_topic.arn
  protocol  = "email"
  endpoint  = "your-email@example.com" # Change to your email
}

# AWS Backup Notifications (SNS)
resource "aws_backup_vault_notifications" "vault_notifications" {
  backup_vault_name = aws_backup_vault.primary_vault.name
  sns_topic_arn     = aws_sns_topic.backup_sns_topic.arn

  events = [
    "BACKUP_JOB_COMPLETED",
    "BACKUP_JOB_FAILED"
  ]
}