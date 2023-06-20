get-modules(1) Version 1.0 

NAME
====

**get_modules** — Get all or specific XR module

SYNOPSIS
========

**get_modules** id *[init=y|yes]*


DESCRIPTION
===========

Get the XR module based on its *Id*. If the *id* is **all**, get all XR modules in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all XR modules               |
|                  |           | - xyz id          | Get the XR module which id is *xyz*               |
| *[init=y\|yes]*    |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get XR Module(s)
------

1. get_modules all *[init=y|yes]*
2. get_modules id *[init=y|yes]*

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>