# Backup Plan Name
variable "backup_plan_name" {
  description = "The name of the backup plan"
  type        = string
  default     = "backup-plan"
}

# Daily Backup Rule Variables
variable "daily_backup_rule_name" {
  description = "The name of the daily backup rule"
  type        = string
  default     = "DailyBackups"
}

variable "daily_target_vault_name" {
  description = "The name of the target vault for daily backups"
  type        = string
  default     = "Default"
}

variable "daily_schedule" {
  description = "The cron schedule for daily backups"
  type        = string
  default     = "cron(0 5 ? * * *)"
}

variable "daily_start_window" {
  description = "The time window in minutes to start the backup"
  type        = number
  default     = 480
}

variable "daily_completion_window" {
  description = "The time window in minutes to complete the backup"
  type        = number
  default     = 10080
}

variable "daily_enable_continuous_backup" {
  description = "Enable continuous backups for the daily rule"
  type        = bool
  default     = false
}

variable "daily_cold_storage_after" {
  description = "Time in days after which the backup is moved to cold storage"
  type        = number
  default     = 0
}

variable "daily_delete_after" {
  description = "Time in days after which the backup is deleted"
  type        = number
  default     = 35
}

# General Backup Rule Variables
variable "backup_rule_name" {
  description = "The name of the general backup rule"
  type        = string
  default     = "backup-rule"
}

