output "vpc_id" {
  value = aws_vpc.testing.id
}

output "subnet_ids" {
  value = aws_subnet.subnet.*.id
}

output "security_group_id" {
  value = aws_security_group.allow_http.id
}
