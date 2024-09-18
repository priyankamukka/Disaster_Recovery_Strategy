resource "aws_backup_plan" "backup_plan" {
  name = "project"

  rule {
    rule_name         = "project"
    target_vault_name = aws_backup_vault.default.name
    schedule          = "cron(0 5 * * ? *)"

    lifecycle {
      delete_after = var.deletion_time
    }
    enable_continuous_backup = true
  }
}