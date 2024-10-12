output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.ec2_sg.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.ec2_sg.name
}

output "security_group_vpc_id" {
  description = "The VPC ID associated with the security group"
  value       = aws_security_group.ec2_sg.vpc_id
}

output "security_group_arn" {
  description = "The ARN of the security group"
  value       = aws_security_group.ec2_sg.arn
}
