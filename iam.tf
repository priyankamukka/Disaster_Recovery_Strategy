
#========
#from himanshi
#========
resource "aws_iam_role" "ssm_role" {
  name = "ssm_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  role       = aws_iam_role.ssm_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-instance-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_iam_role" "ec2_role" {
  name = "example-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_role" "backup_role" {
  name = "AWSBackupDefaultRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "backup_policy" {
  name = "AWSBackupPolicy"
  role = aws_iam_role.backup_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeVolumes",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot",
          "ec2:DescribeSnapshots",
          "s3:GetBucketLocation",
          "s3:ListAllMyBuckets",
          "backup:StartBackupJob",
          "backup:StopBackupJob",
          "backup:CreateBackupVault",
          "backup:DeleteBackupVault",
          "backup:DescribeBackupVault",
          "backup:ListBackupVaults",
          "backup:GetBackupVaultNotifications",
          "backup:PutBackupVaultNotifications",
          "backup:StartRestoreJob",
          "backup:DescribeProtectedResource",
          "backup:ListProtectedResources"
        ],
        Resource = "*"
      }
    ]
  })
}
