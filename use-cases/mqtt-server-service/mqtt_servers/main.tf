terraform {
  required_providers {
    ipm = {
      source = "infinera.com/poc/ipm"
    }
  }
  
}

provider "ipm" {
  username = var.ipm_user
  password = var.ipm_password
  host     = var.ipm_host
}

module "mqtt_servers" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//mqtt-server-service/workflows/mqtt_servers"
  source = "../../../mqtt-server-service/workflows/mqtt_servers"

  mqtt_servers = var.mqtt_servers
  system_profile = var.system_profile
  user_profile   = var.user_profile
}

output "mqtt_servers" {
  value = module.mqtt_servers
}
