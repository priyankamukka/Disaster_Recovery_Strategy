# Output for Backup Plan ARN
output "backup_plan_arn" {
  description = "The ARN of the backup plan"
  value       = aws_backup_plan.backup_plan.arn
}

# Output for Backup Plan ID
output "backup_plan_id" {
  description = "The ID of the backup plan"
  value       = aws_backup_plan.backup_plan.id
}

# Output for Daily Backup Rule Name
output "daily_backup_rule_name" {
  description = "The name of the daily backup rule"
  value       = aws_backup_plan.backup_plan.rule[0].rule_name
}

# Output for General Backup Rule Name
output "backup_rule_name" {
  description = "The name of the general backup rule"
  value       = aws_backup_plan.backup_plan.rule[1].rule_name
}
