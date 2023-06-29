ncs(1) Version 1.0 

NAME
====

**ncs** — Network Connection CRUD Management

SYNOPSIS
========

**ncs** *command* *[init=y|yes]* [intent=intentFileName] [system_profile=systemProfileName] [user_profile=userProfileName] 


DESCRIPTION
===========

Depending on the *command*, the **ncs** function shall create, update, or delete the Transport Capacity.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| command          |  string   | - create          | Create Network Connection based on the intent               |
|                  |           | - update          | Update Network Connection based on the updated intent               |
|                  |           | - plan          | Plan Network Connection               |
|                  |           | - delete          | Delete Network Connection               |
| *[init=y\|yes]*  |           |                   | Only need at the first execution of the IPM service commands      |
| [intent=intentFileName] |           |            | intentFileName is the full path file name of the intent. Not required for *delete* command      |
| [system_profile=systemProfileName] |   |         | systemProfileName is the full path file name of the system profile. No required for *delete* command or if the SYSTEM_PROFILE environment variable is set.    |
| [user_profile=userProfileName] |   |         | userProfileName is the full path file name of the user profile. No required for *delete* command or if the USER_PROFILE environment variable is set.    |

EXAMPLES
===========

Get XR Network's Transport Capacities
------
```
1. get-ncs all 
2. get-ncs id 
```

Create XR Network
------
```
ncs create *[init=y | yes]* intent=/Work-Directory/user-intents/ncs.tfvars system_profile=/Work-Directory/system_profiles/ncs_profiles.json user_profile=/Work-Directory/user-profiles/ncs.json
```

Update XR Network
------
```
1. ncs update intent=/Work-Directory/user-intents/ncs.tfvars system_profile=/Work-Directory/system_profiles/ncs_profiles.json user_profile=/Work-Directory/user-profiles/ncs_profiles.json
```
Delete XR Network
------
```
1. ncs delete intent=/Work-Directory/user-intents/networks.tfvars system_profile=/Work-Directory/system_profiles/ncs_profiles.json user_profile=/Work-Directory/user-profiles/ncs_profiles.json
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