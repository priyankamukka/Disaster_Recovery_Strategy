
resource "aws_instance" "application-server" {
  ami           = "ami-053284fc22a2c3f82"
  instance_type = "t2.micro"
  security_groups = [
    "launch-wizard-1",
  ]
  subnet_id = "subnet-01eedaf0a4fed5d13"
  tags = {
    "Name" = "application-server"
  }
  tags_all = {
    "Name" = "application-server"
  }
}
