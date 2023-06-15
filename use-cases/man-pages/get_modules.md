get-modules(1) Version 1.0 

NAME
====

**get-modules** — Get all or specific XR module

SYNOPSIS
========

**get-modules** moduleId *[init=y|yes]*


DESCRIPTION
===========

Get the XR module based on its *moduleId*. If the *moduleId* is **all**, get all XR modules in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| moduleId         |  string   | - all             | Get all XR modules               |
|                  |           | - xyz id          | Get the XR module which id is *xyz*               |
| [init=y\|yes]    |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get XR Module(s)
------

1. get-modules all init=y
2. get-modules all 
3. get-modules moduleId

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>