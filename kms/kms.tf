# aws_kms_key.kms-key:
resource "aws_kms_key" "kms-key" {

  key_usage = "ENCRYPT_DECRYPT"

  policy = jsonencode(
    {
      Id = var.kms_policy_id
      Statement = [
        {
          Action = "kms:*"
          Effect = "Allow"
          Principal = {
            AWS = var.root_user_arn
          }
          Resource = "*"
          Sid      = "Enable IAM User Permissions"
        },
        {
          Action = var.kms_allowed_actions
          Effect = "Allow"
          Principal = {
            AWS = var.kms_role_arns
          }
          Resource = "*"
          Sid      = "Allow access for Key Administrators"
        },
      ]
      Version = "2012-10-17"
    }
  )
}

# aws_kms_alias.kms-alias:
resource "aws_kms_alias" "kms-alias" {
  name          = var.kms_alias_name
  target_key_id = var.kms_key_id
}
