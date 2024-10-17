# Backup Plan Resource
resource "aws_backup_plan" "backup_plan" {
  name = var.backup_plan_name

  rule {
    rule_name                = var.daily_backup_rule_name
    target_vault_name        = var.daily_target_vault_name
    schedule                 = var.daily_schedule
    start_window             = var.daily_start_window
    completion_window        = var.daily_completion_window
    enable_continuous_backup = var.daily_enable_continuous_backup

    lifecycle {
      cold_storage_after = var.daily_cold_storage_after
      delete_after       = var.daily_delete_after
    }
  }

  rule {
    rule_name                = var.backup_rule_name
    target_vault_name        = var.backup_target_vault_name
    schedule                 = var.backup_schedule
    start_window             = var.backup_start_window
    completion_window        = var.backup_completion_window
    enable_continuous_backup = var.backup_enable_continuous_backup

    lifecycle {
      cold_storage_after = var.backup_cold_storage_after
      delete_after       = var.backup_delete_after
    }
  }
}
