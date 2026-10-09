output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.aws_subnet.id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.aws_vpc.id
}

output "aws_vpc_ip" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.aws_vpc.id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}
output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.aws_security_group.id
}

output "aws_key_pair_name" {
  description = "The name of the AWS Key Pair"
  value       = aws_key_pair.aws_key_pair.key_name
}