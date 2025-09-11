output "pro_vpc" {
    value = aws_vpc.pro_vpc.arn
}

output "pub_subnets" {
  description = "IDs of the public subnets"
  value       = aws_subnet.pub_subnets[*].id
}

output "pri_subnets" {
  description = "IDs of the private subnets"
  value       = aws_subnet.pri_subnets[*].id
}
