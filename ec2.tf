resource "aws_instance" "app_instance" {
  ami                  = "ami-049f0f6f51145ff40"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  # Attach the Security Group to the instance
  vpc_security_group_ids = [aws_security_group.all_sg.id]

  # Optional: Tags for the EC2 instance
  tags = {
    Name = "example-instance"
  }
  # Optional: Use a user-data script to ensure SSM agent is installed and running
  user_data = <<-EOF
              #!/bin/bash
              yum install -y amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF
}


/*
#from chatgpt
# EC2 Instance (Application Server)
resource "aws_instance" "app_instance" {
  ami                         = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  key_name                    = "my-key"

  tags = {
    Name = "App-Instance"
  }
}
*/