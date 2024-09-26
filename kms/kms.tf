# aws_kms_key.kms-key:
resource "aws_kms_key" "kms-key" {

  key_usage = "ENCRYPT_DECRYPT"

  policy = jsonencode(
    {
      Id = "key-consolepolicy-3"
      Statement = [
        {
          Action = "kms:*"
          Effect = "Allow"
          Principal = {
            AWS = "arn:aws:iam::851725542166:root"
          }
          Resource = "*"
          Sid      = "Enable IAM User Permissions"
        },
        {
          Action = [
            "kms:Create*",
            "kms:Describe*",
            "kms:Enable*",
            "kms:List*",
            "kms:Put*",
            "kms:Update*",
            "kms:Revoke*",
            "kms:Disable*",
            "kms:Get*",
            "kms:Delete*",
            "kms:TagResource",
            "kms:UntagResource",
            "kms:ScheduleKeyDeletion",
            "kms:CancelKeyDeletion",
            "kms:RotateKeyOnDemand",
          ]
          Effect = "Allow"
          Principal = {
            AWS = [
              "arn:aws:iam::851725542166:role/service-role/AWSBackupDefaultServiceRole",
              "arn:aws:iam::851725542166:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup",
              "arn:aws:iam::851725542166:role/ec2s3accessrole",
            ]
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
  name          = "alias/kms-alias"
  target_key_id = "216eec37-13aa-48ad-96b6-aff4e5f0271b"
}