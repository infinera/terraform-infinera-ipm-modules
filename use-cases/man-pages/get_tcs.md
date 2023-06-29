get_tcs(1) Version 1.0 

NAME
====

**get_tcs** — Get all or specific Transport Capacity

SYNOPSIS
========

**get_tcs** id 


DESCRIPTION
===========

Get the XR network's Transport Capacity based on its *Id*. If the *Id* is **all**, get all Transport Capacities in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all Transport Capacities               |
|                  |           | - xyz id          | Get the Transport Capacity which id is *xyz*               |

EXAMPLES
===========

Get Transport Capacities(s)
------
```
1. get-tcs all 
2. get-tcs id 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====


AUTHOR
======

Lam Hoang <lhoang@infinera.com>