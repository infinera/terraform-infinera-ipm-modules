get_modules(1) Version 1.0 

NAME
====

**get_modules** — Get all or specific XR module

SYNOPSIS
========

**get_modules** id 


DESCRIPTION
===========

Get the XR module based on its *Id*. If the *id* is **all**, get all XR modules in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all XR modules               |
|                  |           | - xyz id          | Get the XR module which id is *xyz*               |

EXAMPLES
===========

Get XR Module(s)
------
```
1. get_modules all 
2. get_modules id 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====



AUTHOR
======

Lam Hoang <lhoang@infinera.com>