# aws_sns_topic.sns-backup:
resource "aws_sns_topic" "sns-backup" {
  display_name = "sns_notification"
  name         = "BackupJobNotifications"
  policy = jsonencode(
    {
      Id = "__default_policy_ID"
      Statement = [
        {
          Action = "SNS:Publish"
          Condition = {
            StringEquals = {
              "AWS:SourceOwner" = "851725542166"
            }
          }
          Effect = "Allow"
          Principal = {
            Service = "backup.amazonaws.com"
          }
          Resource = "arn:aws:sns:ap-south-1:851725542166:BackupJobNotifications",
          Sid      = "__default_statement_ID"
        },
      ]
      Version = "2008-10-17"
    }
  )
}