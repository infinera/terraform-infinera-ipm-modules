#!/bin/bash
# Check Credential
if [[ -z IPM_USER ]] || [[ -z IPM_HOST ]] || [[ -z IPM_PASSWORD ]]; then
  echo "IPM Server or Credential is not set."
else 
  export TF_VAR_ipm_user=$IPM_USER
  export TF_VAR_ipm_host=$IPM_HOST
  export TF_VAR_ipm_password=$IPM_PASSWORD
fi