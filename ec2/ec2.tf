resource "aws_instance" "application-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [
    aws_security_group.ec2_sg.name,
  ]
  subnet_id = var.subnet_id

  tags = {
    "Name" = var.instance_name
  }

  tags_all = {
    "Name" = var.instance_name
  }
}
