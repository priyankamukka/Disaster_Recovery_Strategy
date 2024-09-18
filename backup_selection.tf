# Backup Vault Replication Rule
resource "aws_backup_selection" "backup_selection" {
  iam_role_arn = aws_iam_role.ec2_role.arn
  name         = "app-backup-selection"
  plan_id      = aws_backup_plan.backup_plan.id
  resources    = [aws_instance.app_instance.arn]
}
