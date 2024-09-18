# Specify the provider
provider "aws" {
  region = "ap-south-1"
}

# Define a Security Group
resource "aws_security_group" "all_sg" {
  name        = "all-sg"
  description = "Example security group"
  vpc_id      = aws_vpc.app_vpc.id # Replace with your VPC ID or remove if not using a VPC

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ec2-sg"
  }
}