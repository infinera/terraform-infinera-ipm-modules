# End To End Operational Modules 
End To End Operational modules are a collection of TF modules to support E2E orchestration of provision and configuration operations on the IPM managed resources across multiple services. 

| E2E Operational Module                                    |  Description                                   | State  |
|-----------------------------------------------------------|------------------------------------------------|--------|

## Prerequisite
1. The "infinera/ipm/config" provider
    a. Build it. Please down load and build the provider https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse
    b. Available in accessible repository. 
2. Terraform (Install terraform via https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. IPM server credentials: Define the following environment variables: TF_VAR_ipm_user, TF_VAR_ipm_password, and TF_VAR_ipm_host. 


## How to Use
Please see the README description of each module for more detail information and examples about their usages.
