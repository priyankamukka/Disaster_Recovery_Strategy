output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.kms-key.arn
}

output "kms_alias_name" {
  description = "The name of the KMS alias"
  value       = aws_kms_alias.kms-alias.name
}
