# ========================================
# VARIABLES DEL MÓDULO NETWORKING
# ========================================

variable "app_name" {
  description = "Nombre de la aplicación"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "common_tags" {
  description = "Tags comunes para los recursos"
  type        = map(string)
  default     = {}
} 