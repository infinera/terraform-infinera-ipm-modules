get-hosts(1) Version 1.0 

NAME
====

**get_hosts** — Get all or specific XR host

SYNOPSIS
========

**get_hosts.sh** id


DESCRIPTION
===========

Get the XR host based on its *Id*. If the *id* is **all**, get all XR hosts in the XR networks.
The output result is saved in the *workingDirectory*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all XR hosts               |
|                  |           | - xyz id          | Get the XR host which id is *xyz*               |

EXAMPLES
===========

Get XR host(s)
------
```
get_hosts.sh all 
get_hosts.sh id 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====



AUTHOR
======

Lam Hoang <lhoang@infinera.com>