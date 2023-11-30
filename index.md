---
title : "Enable Module Telemetry"
description: ""
lead: ""
date: 2023-05-01T08:48:45+00:00
lastmod: 2023-05-01T08:48:45+00:00
draft: false
images: [""]
menu:
  docs:
    parent: "Telemetry"
weight: 59
mermaid: true
---
## Enable Module Telemetry Procedure

1. Export required environment variables
2. Updated the managed Module MQTT Servers

## 1. Export required Environment Variables

Export the following environment variables
```code
export IPM_HOST=host-a
export IPM_HOST_IP=host-a-IP
export IPM_USER=host-a-user
export IPM_PWD=host-a-user-pwd
```

## 2. Updated the managed Module MQTT Servers

Now to update the MQTT Server settings based on the intent, execute the command below (*make sure to update the **intent file** to the desired values before executing the command*)

```code
docker run -v "$(pwd)":/Work-Directory -e TF_VAR_ipm_host=${IPM_HOST} -e TF_VAR_ipm_user=${IPM_USER} -e TF_VAR_ipm_password=${IPM_PWD} --add-host=${IPM_HOST}:${IPM_HOST_IP} sv-artifactory.infinera.com/marvel/ipm/ipm-services:1.0.0 "mqtt_servers.sh apply intent_file"
```
1. In the command above, make sure the MQTT Server Configuration command *mqtt_servers.sh apply intent_file*  is enclosed in quote such as **"mqtt_servers.sh apply intent_file"**.
2. The intent file name must be in **xyz.tfvars** format and it must be placed in the same directory which the command above is executed.

Execute the command above shall update the specified modules's MQTT Server attributes with the desired values in the intent.The command result shall be displayed in the console and its output is saved in the *mqtt_servers_output.json* file at the current directory.


### The MQTT Server Configuration Intent definition

| Attribute               | Type   | Possible Values     | Default   | Description                                   |
|-------------------------|--------|---------------------|-----------|-----------------------------------------------|
| identifier              | object |                 |           | Module Identifier. Please *identifier* definition below.    |
| server            | string |         |           |  The connection information of the MQTT server |
| port            | number |         |           | The port to connect too |
| enabled              | boolean |   |           |  Enabled/Disabled MQTT server connection.  |

#### The Identifier Object Definition
| Attribute               | Type   | Possible Values | Default   | Description                                   |
|-------------------------|--------|-----------------|-----------|-----------------------------------------------|
| module_id, module_name, module_serial_number or module_mac_address | string |  |  | **Only need to enter one**    |
| server_id                   | string |               |           | ID of MQTT server |

### MQTT Server Configuration Intent Example
In the command 
```code
docker run -v "$(pwd)":/Work-Directory -e TF_VAR_ipm_host=${IPM_HOST} -e TF_VAR_ipm_user=${IPM_USER} -e TF_VAR_ipm_password=${IPM_PWD} --add-host=${IPM_HOST}:${IPM_HOST_IP} sv-artifactory.infinera.com/marvel/ipm/ipm-services:1.0.0 "mqtt_servers.sh apply xyz.tfvars"
```
 The **xyz.tfvars** intent will specified the desired MQTT Server attributes for two modules using *module_name* as part of the module identifier and the desired attributes's values.

**xyz.tfvars**
```json
cat > xyz.tfvars
mqtt_servers  = [
              { identifier = {module_name = "MA122232A001", server_id = "1"},
                server = "10.100.69.138", port = 31883, enabled = true
              },
              { identifier = {module_name = "MA222324A004", server_id = "1"},
                server = "10.100.69.138", port = 31883, enabled = true
              },
]
```
