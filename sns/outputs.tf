# Output for SNS Topic ARN
output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.sns_backup.arn
}

# Output for SNS Topic Name
output "sns_topic_name" {
  description = "The name of the SNS topic"
  value       = aws_sns_topic.sns_backup.name
}
