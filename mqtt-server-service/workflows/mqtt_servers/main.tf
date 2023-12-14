terraform {
  required_providers {
    ipm = {
      source = "infinera/ipm"
      version = "~>0.4.0"
    }
  }
}


module "mqtt_servers" {
  //source   = "git::https://bitbucket.infinera.com/scm/mar/terraform-ipm-modules.git//mqtt-server-service/tasks/mqtt_servers"
  source = "../../../mqtt-server-service/tasks/mqtt_servers"

  mqtt_servers = var.mqtt_servers
}

output "mqtt_servers" {
  value = module.mqtt_servers
}
