get_tcs_capacity_links(1) Version 1.0 

NAME
====

**get_tcs_capacity_links** — Get all or specific Capacity Link

SYNOPSIS
========

**get_tcs_capacity_links** Id 


DESCRIPTION
===========

Get the Capacity Links based on its *Id*. If the *Id* is **all**, get all Capacity Links in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| Id         |  string   | - all             | Get all Capacity Links               |
|                  |           | - xyz id          | Get the Capacity Link which id is *xyz*               |

EXAMPLES
===========

Get Capacity Link(s)
------
```
1. get_tcs_capacity_links all 
2. get_tcs_capacity_links Id 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====


AUTHOR
======

Lam Hoang <lhoang@infinera.com>