# Terraform IPM Modules 
Terraform IPM Modules are a collection of TF modules to support provision and configuration operations on the IPM managed services and End to End Network Operational Workflow across multiple services. 

## IPM Services' Provision and Configuration Modules
Each service shall have a collection of TF modules for configurations of its resources.

| Service                                                   |  Description                                   | State  |  Quick Start |
|-----------------------------------------------------------|------------------------------------------------|--------|-----------|
| [Host Management Service](https://github.com/infinera/terraform-ipm_modules/tree/master/module-management-service)    |     | In Progress |      |
| [Module Management Service](https://github.com/infinera/terraform-ipm_modules/tree/master/module-management-service)                         |                                                | In Progress  |       |
| [Network Service](https://github.com/infinera/terraform-ipm_modules/tree/master/network-service)                       |                                                | Ready  |       |
| [Transport Capacity Service](https://github.com/infinera/terraform-ipm_modules/tree/master/transport-capacity-service) |                                                | In Progress  |       |
| [Network Connection Service](https://github.com/infinera/terraform-ipm_modules/tree/master/network-service) |                                                | In Progress |       |
| [Module Software Manager](https://github.com/infinera/terraform-ipm_modules/tree/master/module-software-manager)       |                                                |        |       |
| [NDU Service](https://github.com/infinera/terraform-ipm_modules/tree/master/ndu-service)                               |                                                |        |       |
| [Device Aggregator](https://github.com/infinera/terraform-ipm_modules/tree/master/device-aggregator)   |                                                |        |
| [Aggregator Fault Management Service](https://github.com/infinera/terraform-ipm_modules/tree/master/aggregator-fault-management-service)     |                                                |        |       |
| [Domain Fault Management Service](https://github.com/infinera/terraform-ipm_modules/tree/master/domain-fault-management-service)             |                                                |        |       |
| [Event Gateway](https://github.com/infinera/terraform-ipm_modules/tree/master/event-gateway)           |                                                |        |       |
| [Onboarding Tool](https://github.com/infinera/terraform-ipm_modules/tree/master/onboard-tool)          |                                                |        |       |
| [Author Server](https://github.com/infinera/terraform-ipm_modules/tree/master/author-server) |                  |   |       |

# IPM E2E Network Operational Modules
These modules are used to orchestrate the E2E configuration and provisioning of constellation networks and their resources across multiple services.

| E2E Orchestration Modules                                 |  Description                                   | State  |
|-----------------------------------------------------------|------------------------------------------------|--------|
| [E2E Orchestration](e2e-orchestration)                    |                                                | TBD    |

### How to Use
Please see the README description for more detail information and examples about their usages.

# Manage the XR Network via Configuration Intent and IPM Service Docker Image
Please see [Manage the XR Network via Configuration Intent](https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse/Manage-XR-Network-Using%20-IPM-Services.md) for more details.
