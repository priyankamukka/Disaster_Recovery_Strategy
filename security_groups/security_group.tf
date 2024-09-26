resource "aws_security_group" "ec2_sg" {
  description = "launch-wizard-1 created 2024-09-20T18:28:59.958Z"
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]
  ingress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 3389
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 3389
    },
  ]
  name = "launch-wizard-1"
  tags = {
    "Name" = "ec2-sg"
  }
  tags_all = {
    "Name" = "ec2-sg"
  }
  vpc_id = "vpc-0cf9c8bf976465e4f"
}