get_networks(1) Version 1.0 

NAME
====

**get_networks** — get all or specific XR Network

SYNOPSIS
========

**get_networks** id 


DESCRIPTION
===========

Get the XR network based on its *networkId*. If the *networkId* is **all**, get all XR modules in the XR networks.


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
1. get_networks all 
2. get_networks id 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====



AUTHOR
======

Lam Hoang <lhoang@infinera.com>