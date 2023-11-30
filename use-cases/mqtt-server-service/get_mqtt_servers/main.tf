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

module "get_mqtt_servers" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//mqtt-server-service/tasks/get_mqtt_servers"
  source = "../../../mqtt-server-service/tasks/get_mqtt_servers"

  mqtt_servers = var.mqtt_servers
}

output "mqtt_servers" {
  value = module.get_mqtt_servers
}
