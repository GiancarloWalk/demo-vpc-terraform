variable "vpc-name" {
  default     = "gtg-vpc-demo"
  description = "Ingresar nombre de la VPC"
}

variable "resource_group" {
  default     = "proyectoGTG"
  description = "Ingresar nombre del grupo de recursos existente (proyectoGTG)"
}

variable "zone" {
  default     = "us-south-1"
  description = "Define la zona 'us-south-1'"
}


variable "vpc-secure-bastion-subnet" {
  default     = "10.240.0.0/24"
  description = "Define la Subnet vpc-secure-bastion-subnet '10.240.0.0/24'"
}

variable "vpc-pubpriv-backend-subnet" {
  default     = "10.240.1.0/24"
  description = "Define la Subnet vpc-pubpriv-backend-subnet '10.240.1.0/24'"
}

variable "vpc-pubpriv-frontend-subnet" {
  default     = "10.240.2.0/24"
  description = "Define la Subnet vpc-pubpriv-frontend-subnet '10.240.2.0/24'"
}

variable "ssh_public_key" {
  default     = "ssh_pub_key.pub"
  description = "Define la ruta del ssh publc key"

}

variable "image" {
  default     = "7eb4e35b-4257-56f8-d7da-326d85452591"
  description = "The ID of the image that represents the operating system that you want to install on your VPC virtual server. To list available images, run `ibmcloud is images`. The default image is for an `ubuntu-16.04-amd64` OS."
}

variable "vsi-bastion-name" {
  default     = "vpc-secure-bastion-vsi"
  description = "nombre del vsi vpc-secure-bastion-vsi"
}
variable "vsi-profile-bastion" {
  default = "cc1-2x4"
  description = "profile de del vsi cc1-2x4"
}

variable "vsi-frontend-name" {
  default     = "vpc-pubpriv-frontend-vsi"
  description = "nombre del vsi vpc-pubpriv-frontend-vsi"
}
variable "vsi-profile-frontend" {
  default     = "cc1-2x4"
  description = "profile de del vsi cc1-2x4"
}

variable "filepath_frontend_init" {
  default     = "frontend_init.sh"
  description = "Ruta del init: "
}

variable "vsi-backend-name" {
  default     = "vpc-pubpriv-backend-vsi"
  description = "nombre del vsi vpc-pubpriv-backend-vsi"
}
variable "vsi-profile-backend" {
  default     = "cc1-2x4"
  description = "profile de del vsi cc1-2x4"
}

variable "filepath_backend_init" {
  default     = "backend_init.sh"
  description = "Ruta del init: "
}

variable "iam_access_devs_members" {
  type        = "list"
  description = "Ingresar los correos de los usuarios separados por comas: "
}

variable "iam_access_testers_members" {
  type        = "list"
  description = "Ingresar los correos de los usuarios separados por comas: "
}
