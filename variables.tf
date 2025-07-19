# =================================
# VARIABLES GLOBALES DEL PROYECTO
# =================================

# Configuración AWS
variable "aws_region" {
  description = "Región de AWS donde desplegar los recursos"
  type        = string
  default     = "us-east-1"
}

# Configuración de la aplicación
variable "app_name" {
  description = "Nombre de la aplicación"
  type        = string
  default     = "gestion-personal"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "prod"
}

# Configuración de base de datos
variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "gestionpersonal"
}

variable "db_instance_class" {
  description = "Clase de instancia para RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "Versión del motor PostgreSQL"
  type        = string
  default     = "16.8"
}

# Configuración de EC2
variable "ec2_instance_type" {
  description = "Tipo de instancia para EC2"
  type        = string
  default     = "t2.micro"
}

# Configuración SSL
variable "domain_name" {
  description = "Nombre del dominio principal"
  type        = string
  default     = "pasteleriaprimavera.social"
}

variable "subdomain_name" {
  description = "Subdominio de la aplicación"
  type        = string
  default     = "www.pasteleriaprimavera.social"
}

# =================================
# VARIABLES SECRETAS DE LA APLICACIÓN
# =================================

variable "email_password" {
  description = "Contraseña para el email sender"
  type        = string
  sensitive   = true
}

variable "google_client_id" {
  description = "Google OAuth Client ID"
  type        = string
  sensitive   = true
}

variable "google_secret_id" {
  description = "Google OAuth Secret"
  type        = string
  sensitive   = true
}

variable "secret_password" {
  description = "Contraseña secreta de la aplicación"
  type        = string
  sensitive   = true
}

variable "aws_s3_bucket_name" {
  description = "Nombre del bucket S3 para fotos"
  type        = string
}

variable "aws_access_key" {
  description = "AWS Access Key para la aplicación"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key para la aplicación"
  type        = string
  sensitive   = true
}

variable "openapi_key" {
  description = "Clave API de OpenAI"
  type        = string
  sensitive   = true
}

# =================================
# CONFIGURACIÓN DE TAGS
# =================================

variable "common_tags" {
  description = "Tags comunes para todos los recursos"
  type        = map(string)
  default = {
    Project     = "GestionPersonal"
    ManagedBy   = "Terraform"
    Environment = "production"
  }
} 