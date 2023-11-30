terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
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