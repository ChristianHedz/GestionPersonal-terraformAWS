# ========================================
# OUTPUTS DEL MÓDULO NETWORKING
# ========================================

# VPC Information
output "vpc_id" {
  description = "ID de la VPC por defecto"
  value       = data.aws_vpc.default.id
}

output "vpc_cidr_block" {
  description = "CIDR block de la VPC"
  value       = data.aws_vpc.default.cidr_block
}

# Subnets Information
output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = data.aws_subnets.default.ids
}

# Security Groups
output "alb_security_group_id" {
  description = "ID del security group del ALB"
  value       = aws_security_group.alb.id
}

output "ec2_security_group_id" {
  description = "ID del security group de EC2"
  value       = aws_security_group.ec2.id
}

output "rds_security_group_id" {
  description = "ID del security group de RDS"
  value       = aws_security_group.rds.id
}

# Security Group Names
output "alb_security_group_name" {
  description = "Nombre del security group del ALB"
  value       = aws_security_group.alb.name
}

output "ec2_security_group_name" {
  description = "Nombre del security group de EC2"
  value       = aws_security_group.ec2.name
}

output "rds_security_group_name" {
  description = "Nombre del security group de RDS"
  value       = aws_security_group.rds.name
} 