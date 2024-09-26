resource "aws_backup_plan" "backup_plan" {
  name = "backup-plan"

  rule {
    rule_name                = "DailyBackups"
    target_vault_name        = "Default"
    schedule                 = "cron(0 5 ? * * *)"
    start_window             = 480
    completion_window        = 10080
    enable_continuous_backup = false

    lifecycle {
      cold_storage_after = 0
      delete_after       = 35
    }
  }

  rule {
    rule_name                = "backup-rule"
    target_vault_name        = "backup_vault"
    schedule                 = "cron(5 12 ? * * *)"
    start_window             = 60
    completion_window        = 120
    enable_continuous_backup = true

    lifecycle {
      cold_storage_after = 0
      delete_after       = 7
    }
  }
}
