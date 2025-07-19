# 🏗️ Gestión Personal - Infraestructura Terraform

Proyecto de infraestructura como código para la aplicación de Gestión Personal usando Terraform y AWS.

## 📋 Descripción

Este proyecto despliega una aplicación web completa en AWS con:
- **Base de datos PostgreSQL** en RDS
- **Aplicación Java** en Elastic Beanstalk 
- **Load Balancer** con certificado SSL
- **Gestión de secretos** con AWS Secrets Manager
- **Arquitectura modular** y reutilizable

## 🏗️ Arquitectura

```
Internet → ALB (HTTPS) → Elastic Beanstalk → RDS PostgreSQL
                ↓
           Secrets Manager (credenciales)
```

## 📁 Estructura del Proyecto

```
terraform-gestionpersonal/
├── explicaciones/           # 📚 Tutoriales paso a paso
├── modules/                 # 🧩 Módulos reutilizables
│   ├── networking/          # 🌐 VPC, Security Groups
│   ├── database/            # 🗄️ RDS PostgreSQL
│   ├── compute/             # 💻 Elastic Beanstalk
│   ├── security/            # 🔐 IAM, Secrets Manager
│   └── ssl/                 # 🔒 Certificados SSL
├── environments/            # 🏷️ Configuraciones por entorno
│   ├── dev/
│   ├── staging/
│   └── prod/
├── main.tf                  # 🎯 Archivo principal
├── variables.tf             # 📝 Variables globales
├── outputs.tf               # 📤 Outputs del proyecto
├── versions.tf              # 🔧 Configuración de providers
├── terraform.tfvars.example # 📋 Ejemplo de configuración
└── .gitignore              # 🚫 Archivos excluidos de git
```

## 🚀 Instalación y Uso

### Prerrequisitos

- [Terraform](https://terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Credenciales AWS con permisos apropiados

### Configuración Inicial

1. **Clona el repositorio:**
   ```bash
   git clone <tu-repositorio>
   cd terraform-gestionpersonal
   ```

2. **Configura las variables:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edita terraform.tfvars con tus valores reales
   ```

3. **Inicializa Terraform:**
   ```bash
   terraform init
   ```

4. **Revisa el plan:**
   ```bash
   terraform plan
   ```

5. **Aplica la infraestructura:**
   ```bash
   terraform apply
   ```

## 📚 Tutoriales Incluidos

En la carpeta `explicaciones/` encontrarás archivos `.txt` que explican cada paso:

- `01-estructura-proyecto.txt` - Organización del proyecto
- `02-versions-y-providers.txt` - Configuración de Terraform
- `03-variables-globales.txt` - Gestión de variables
- `04-terraform-tfvars.txt` - Configuración de valores
- `05-modulo-networking.txt` - Redes y seguridad
- Y más...

## 🔒 Seguridad

⚠️ **IMPORTANTE**: 
- El archivo `terraform.tfvars` contiene secretos y **NO se sube a git**
- Usa `terraform.tfvars.example` como referencia
- Todos los secretos se almacenan en AWS Secrets Manager

## 🏷️ Variables Principales

| Variable | Descripción | Default |
|----------|-------------|---------|
| `aws_region` | Región de AWS | `us-east-1` |
| `app_name` | Nombre de la aplicación | `gestion-personal` |
| `environment` | Entorno de despliegue | `prod` |
| `domain_name` | Dominio principal | - |
| `db_instance_class` | Tipo de instancia RDS | `db.t3.micro` |

## 📤 Outputs

Después del despliegue, obtendrás:
- URL de la aplicación
- Endpoint de la base de datos
- IDs de los recursos creados

## 🤝 Contribución

1. Crea una rama para tu feature
2. Realiza tus cambios
3. Asegúrate de no subir `terraform.tfvars`
4. Crea un pull request

## 📄 Licencia

Este proyecto está bajo la licencia MIT.

## 🆘 Soporte

Si tienes problemas:
1. Revisa los archivos de explicación en `explicaciones/`
2. Verifica que todas las variables estén configuradas
3. Asegúrate de tener los permisos AWS necesarios

---

**Creado con ❤️ usando Terraform y buenas prácticas de DevOps** 