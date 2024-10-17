# SNS Topic Resource
resource "aws_sns_topic" "sns_backup" {
  display_name = var.sns_display_name
  name         = var.sns_name
  
  policy = jsonencode(
    {
      Id = "__default_policy_ID"
      Statement = [
        {
          Action = "SNS:Publish"
          Condition = {
            StringEquals = {
              "AWS:SourceOwner" = var.source_owner
            }
          }
          Effect = "Allow"
          Principal = {
            Service = "backup.amazonaws.com"
          }
          Resource = var.sns_topic_arn,
          Sid      = "__default_statement_ID"
        },
      ]
      Version = "2008-10-17"
    }
  )
}
