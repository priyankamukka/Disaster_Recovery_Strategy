output "instance_id" {
  description = "The ID of the application server EC2 instance"
  value       = aws_instance.application-server.id
}

output "public_ip" {
  description = "The public IP of the application server EC2 instance"
  value       = aws_instance.application-server.public_ip
}
/*
output "security_group_id" {
  description = "The security group ID associated with the EC2 instance"
  value       = aws_security_group.ec2_sg.id
}
*/