get-networks(1) Version 1.0 

NAME
====

**get_tcs_capacity_links** — Get all or specific Capacity Link

SYNOPSIS
========

**get_tcs_capacity_links** Id *[init=y|yes]*


DESCRIPTION
===========

Get the Capacity Links based on its *Id*. If the *Id* is **all**, get all Capacity Links in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| Id         |  string   | - all             | Get all Capacity Links               |
|                  |           | - xyz id          | Get the Capacity Link which id is *xyz*               |
| *[init=y\|yes]*    |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get Capacity Link(s)
------

1. get_tcs_capacity_links all *[init=y|yes]*
2. get_tcs_capacity_links Id *[init=y|yes]*

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>