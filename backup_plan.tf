resource "aws_backup_vault" "example" {
  name = "example-backup-vault"
}

resource "aws_backup_plan" "backup_plan" {
  name = "example-backup-plan"

  rule {
    rule_name = "daily-backup"
    schedule  = "cron(0 12 * * ? *)"
    target_vault_name = aws_backup_vault.example.name
  }
}
