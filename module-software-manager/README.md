# Module Software Management 

# Prerequisite
1. The "infinera/ipm/config" provider
    a. Build it. Please down load and build the provider https://bitbucket.infinera.com/projects/MAR/repos/terraform-provider-ipm/browse
    b. Available in accessible repository. 
2. Terraform (Install terraform via https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. IPM server credentials: Define the following environment variables: TF_VAR_ipm_user, TF_VAR_ipm_password, and TF_VAR_ipm_host. 
4. If it is required, the user defined profiles.json must be available in the TF root directory (where the command "terraform apply" is executed)


# How to Use

