get_networks(1) Version 1.0 

NAME
====

**get_networks** — get all or specific XR Network

SYNOPSIS
========

**get_networks.sh** id 


DESCRIPTION
===========

Get the XR network based on its *networkId*. If the *networkId* is **all**, get all XR modules in the XR networks.
The output result is saved in the *workingDirectory*.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all XR networks               |
|                  |           | - xyz id          | Get the XR networks which id is *xyz*               |

EXAMPLES
===========

Get XR Networks(s)
------
```
get_networks.sh all 
get_networks.sh id 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====



AUTHOR
======

Lam Hoang <lhoang@infinera.com>