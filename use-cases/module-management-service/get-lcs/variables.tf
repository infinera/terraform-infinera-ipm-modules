variable "ipm_user" {
  type = string
}

variable "ipm_password" {
  type      = string
  sensitive = true
}

variable "ipm_host" {
  type = string
}

variable "module_id" {
  type = string
}

variable "col_id" {
  type = string
}
