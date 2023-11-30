ncs(1) Version 1.0 

NAME
====

**e2encs** — Network Connection CRUD Management

SYNOPSIS
========

**e2encs.sh** *command* [intent=intentFileName] [system_profile=systemProfileName] [user_profile=userProfileName] 


DESCRIPTION
===========

Depending on the *command*, the **e2encs** function shall create, update, or delete the E2E Network Connection resources from the constellation Network to the Transport Capacity and then the Network Connection.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| command          |  string   | - apply          | Create/Update the E2E Network Connection resources based on the intent               |
|                  |           | - plan          | Plan the E2E Network Connection's resources              |
|                  |           | - delete          | Delete the E2E Network Connection' resources              |
|                  |           | - init            | Only need at the first execution of the IPM service commands      |
|                  |           | - recover         | copy the saved TF state file back.      |
| [intent=intentFileName] |           |            | intentFileName is the full path file name of the intent. Not required for *delete* command      |
| [system_profile=systemProfileName] |   |         | systemProfileName is the full path file name of the system profile. No required for *delete* command or if the SYSTEM_PROFILE environment variable is set.    |
| [user_profile=userProfileName] |   |         | userProfileName is the full path file name of the user profile. No required for *delete* command or if the USER_PROFILE environment variable is set.    |

EXAMPLES
===========

Get XR Network's Transport Capacities
------
```
get_network_connections.sh all 
get_network_connections.sh id 
```

Create E2E XR Network
------
```
e2encs.sh *apply* intent=ncs.tfvars
```
Update XR Network
------
After make change in the intent file; enter the command below
```
e2encs.sh *apply* intent=ncs.tfvars system_profile=ncs_profiles.json 
```
Delete XR Network
------
```
e2encs.sh *delete* intent=networks.tfvars
```

ENVIRONMENT
===========

1. SYSTEM_PROFILE. It is used if the command argument *system_profile* is not set.
2. USER_PROFILE. It is used if the command argument *user_profile* is not set.


TROUBLE SHOOTING
====

If the command keeps failing, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>