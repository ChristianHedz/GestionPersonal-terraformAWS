# ========================================
# MÓDULO NETWORKING - REDES Y SEGURIDAD
# ========================================

# Usar la VPC por defecto para reducir costos
data "aws_vpc" "default" {
  default = true
}

# Obtener las subnets públicas por defecto
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

# ========================================
# SECURITY GROUPS
# ========================================

# Security group para el Application Load Balancer
resource "aws_security_group" "alb" {
  name_prefix = "${var.app_name}-alb-"
  description = "Security group for the Application Load Balancer"
  vpc_id      = data.aws_vpc.default.id

  # Permitir tráfico HTTP (puerto 80)
  ingress {
    description = "HTTP"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir tráfico HTTPS (puerto 443)
  ingress {
    description = "HTTPS"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir todo el tráfico de salida
  egress {
    description = "All outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.app_name}-alb-sg"
    Type = "security-group"
  })

  lifecycle {
    create_before_destroy = true
  }
}

# Security group para las instancias EC2
resource "aws_security_group" "ec2" {
  name_prefix = "${var.app_name}-ec2-"
  description = "Security group for the EC2 instances"
  vpc_id      = data.aws_vpc.default.id

  # Permitir tráfico desde el ALB al puerto de la aplicación (5000)
  ingress {
    description     = "Application port from ALB"
    protocol        = "tcp"
    from_port       = 5000
    to_port         = 5000
    security_groups = [aws_security_group.alb.id]
  }

  # Permitir todo el tráfico de salida
  egress {
    description = "All outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.app_name}-ec2-sg"
    Type = "security-group"
  })

  lifecycle {
    create_before_destroy = true
  }
}

# Security group para RDS (PostgreSQL)
resource "aws_security_group" "rds" {
  name_prefix = "${var.app_name}-rds-"
  description = "Security group for the RDS instance"
  vpc_id      = data.aws_vpc.default.id

  # Permitir conexiones PostgreSQL desde las instancias EC2
  ingress {
    description     = "PostgreSQL from EC2"
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = [aws_security_group.ec2.id]
  }

  # Permitir todo el tráfico de salida
  egress {
    description = "All outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.app_name}-rds-sg"
    Type = "security-group"
  })

  lifecycle {
    create_before_destroy = true
  }
} 