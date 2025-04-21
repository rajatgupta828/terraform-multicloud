output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private : subnet.id]  # <-- FIXED
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]   # <-- FIXED
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}