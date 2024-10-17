# Output for Bucket Name
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.bucket
}

# Output for Bucket ARN
output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.arn
}
