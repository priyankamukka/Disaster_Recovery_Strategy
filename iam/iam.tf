# Create an IAM Role for EC2 to access S3
resource "aws_iam_role" "ec2_s3_role" {
  name        = "ec2s3accessrole"
  description = "Allows EC2 instances to call AWS services on your behalf."

  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  ]
  path = "/"
}

# Create an IAM Role for s3 to access AWS Backup
resource "aws_iam_role" "BackupS3AccessRole" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "backup.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  description = "Allows AWS Backup to access AWS resources on your behalf based on the permissions you define."
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEventBridgeReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
  ]
  name = "BackupS3AccessRole"
  path = "/"

  inline_policy {
    name = "EventBridgePutRulePolicy"
    policy = jsonencode(
      {
        Statement = [
          {
            Action = [
              "events:PutRule",
              "events:PutTargets",
              "events:ListRules",
              "events:ListTargetsByRule",
              "events:DescribeRule",
              "events:DeleteRule",
              "events:RemoveTargets",
            ]
            Effect   = "Allow"
            Resource = "*"
          },
        ]
        Version = "2012-10-17"
      }
    )
  }
}

/*
# Attach S3 Access Policy to the IAM Role
resource "aws_iam_policy_attachment" "s3_access_policy" {
  name       = "ec2-s3-access-attachment"
  roles      = [aws_iam_role.ec2_s3_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Create an IAM Instance Profile for EC2
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-s3-instance-profile"
  role = aws_iam_role.ec2_s3_role.name
}
*/