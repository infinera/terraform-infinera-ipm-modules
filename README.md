# Terraform IPM Modules 
Terraform IPM Modules are a collection of TF modules to support provision and configuration operations on the IPM managed services and End to End Network Operational Workflow across multiple services. 

## IPM Services' Provision and Configuration Modules
Each service shall have a collection of TF modules for configurations of its resources.

| Service                                                   |  Description                                   | State  |
|-----------------------------------------------------------|------------------------------------------------|--------|
| [Host Management Service](host-mgnmt)                             |                                                | In Progress |
| [Module Management Service](module-mgnmt)                         |                                                | In Progress  |
| [Network Service](network-mgnmt)                       |                                                | Ready  |
| [Transport Capacity Service](transport-capacity-mgnmt) |                                                | Ready  |
| [Network Connection Service](network-connection-mgnmt) |                                                | In Progress |
| [Module Software Manager](module-software-mgnmt)       |                                                |        |
| [NDU Service](ndu-mgnmt)                               |                                                |        |
| [Device Aggregator](device-aggregator-mgnmt)   |                                                |        |
| [Aggregator Fault Management Service](aggregator-fault-mgnmt)     |                                                |        |
| [Domain Fault Management Service](domain-fault-mgnmt)             |                                                |        |
| [Event Gateway](event-gateway-mgnmt)           |                                                |        |
| [Onboarding Tool](onboard-tool-mgnmt)          |                                                |        |
| Author Server |                                                |   |

### How to Use
Please see the README description of each service for more detail information and examples about their usages.

# IPM E2E Network Operational Modules
These modules are used to orchestrate the E2E configuration and provisioning of constellation networks and their resources across multiple services.

| E2E Orchestration Modules                                 |  Description                                   | State  |
|-----------------------------------------------------------|------------------------------------------------|--------|
| [E2E Orchestration](e2e-orchestration)                    |                                                | TBD    |

### How to Use
Please see the README description for more detail information and examples about their usages.