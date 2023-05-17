# Terraform IPM Modules 
Terraform IPM Modules are a collection of TF modules to support provision and configuration operations on the IPM managed services and End to End Network Operational Workflow across multiple services. 

## IPM Services' Provision and Configuration Modules
Each service shall have a collection of TF modules for configurations of its resources.

| Service                                                   |  Description                                   | State  |
|-----------------------------------------------------------|------------------------------------------------|--------|
| [Aggregator Fault Management](aggregator-fault-mgnmt)     |                                                |        |
| [Device Aggregator Management](device-aggregator-mgnmt)   |                                                |        |
| [Domain Fault Management](domain-fault-mgnmt)             |                                                |        |
| [Event Gateway Management](event-gateway-mgnmt)           |                                                |        |
| [Host Management](host-mgnmt)                             |                                                | In Progress |
| [Module Management](module-mgnmt)                         |                                                |        |
| [Network Connection Management](network-connection-mgnmt) |                                                | In Progress |
| [NDU Management](ndu-mgnmt)                               |                                                |        |
| [Network Management](network-mgnmt)                       |                                                | Ready  |
| [Onboarding Tool Management](onboard-tool-mgnmt)          |                                                |        |
| [Module Software Management](module-software-mgnmt)       |                                                |        |
| [Transport Capacity Management](transport-capacity-mgnmt) |                                                | Ready  |

### How to Use
Please see the README description of each service for more detail information and examples about their usages.

# IPM E2E Network Operational Modules
These modules are used to orchestrate the E2E configuration and provisioning of constellation networks and their resources across multiple services.

| E2E Orchestration Modules                                 |  Description                                   | State  |
|-----------------------------------------------------------|------------------------------------------------|--------|
| [E2E Orchestration](e2e-orchestration)                    |                                                | TBD    |

### How to Use
Please see the README description for more detail information and examples about their usages.