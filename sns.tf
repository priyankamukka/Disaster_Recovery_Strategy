
# AWS Backup Notifications (SNS)


resource "aws_backup_vault" "backup_sns_topic" {
  name = "example-backup-vault"
}

resource "aws_backup_vault_notifications" "vault_notifications" {
  backup_vault_name = aws_backup_vault.backup_sns_topic.name
  backup_vault_events = ["BACKUP_JOB_STARTED", "BACKUP_JOB_COMPLETED"]

  sns_topic_arn = aws_sns_topic.example.arn
}

resource "aws_sns_topic" "example" {
  name = "example-topic"
}
