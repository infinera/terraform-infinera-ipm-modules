terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm/config"
      version = "~> 0.4.0"
    }
  }
}

locals {
  profiles = length("${var.profile}") > 0 ? fileexists("${var.profile}") ? jsondecode(file("${var.profile}")) : {} : {}

}

variable "profile" {
  type = string
}

 
output "profiles" {
  value = local.profiles
}