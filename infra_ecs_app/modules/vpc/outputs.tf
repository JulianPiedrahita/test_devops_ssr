output "vpc_id" {
  value = aws_vpc.develop.id
}

output "subnet_ids" {
  value = aws_subnet.subnet.*.id
}

output "security_group_id" {
  value = aws_security_group.allow_http.id
}
