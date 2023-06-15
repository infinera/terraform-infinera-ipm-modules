setup(1) Version 1.0 

NAME
====

**setup** — Setup the environment for IPM service commands's executions. This should be the first command executed by user after the IPM service container is up.

SYNOPSIS
========

**setup** workingDirectory


DESCRIPTION
===========

Setup command shall create the working directory and set all required environment variables for IPM services's provision and configurations. In the working directory the user shall issue the desired IPM service commands to manage the IPM XR networks. All IPM services' resources terraform states and outputs shall be stores in the working directory. 

In addition, to allow exporting of the environment variables such as the IPM host credentials in the IPM service container, the *setup* command shall execute (*source*) the user defined environment variables in the *export_variables.sh* file located in the host volume. I.E. if the host volume is */xyz*, the *setup* command shall check and run the */xyz/export_variables.sh* script to export the variables. Please see the *export_vars_example.sh* script for sample of the export variables.

Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| workingDirectory |  string   |                   | The working directory where all the IPM Service commands'outputs and Terraform states are store.            |

EXAMPLES
===========

Set up *testArea1* as the working directory.
------

1. . setup.sh *testArea1*

ENVIRONMENT
===========

1. WORK_DIR: The working directory which all the TF outputs and states are stored.
2. TF_ROOT: The parent directory of the IPM services' use cases directories where the Terraform commands are executed.
3. Required variables which can place in the */xyz/export_variables.sh*
```
  # export system and user profile 
  export SYSTEM_PROFILE="full path to system profile"
  export USER_PROFILE="full path to user profile"

  # export IPM server credentials
  export TF_VAR_ipm_user="aa"
  export TF_VAR_ipm_host="bb"
  export TF_VAR_ipm_password="cc"
```

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>