get-networks(1) Version 1.0 

NAME
====

**get-networks** — get all or specific XR Network

SYNOPSIS
========

**get_networks** id *[init=y|yes]*


DESCRIPTION
===========

Get the XR network based on its *networkId*. If the *networkId* is **all**, get all XR modules in the XR networks.


Arguments
-------

| Argument         |  Type     | Valid Values      | Description                   |
|------------------|-----------|-------------------|-------------------------------|
| id         |  string   | - all             | Get all XR networks               |
|                  |           | - xyz id          | Get the XR networks which id is *xyz*               |
| *[init=y\|yes]*    |           |                   | Only need at the first execution the IPM service commands      |

EXAMPLES
===========

Get XR Networks(s)
------

1. get_networks all *[init=y|yes]
2. get_networks id *[init=y|yes]*

ENVIRONMENT
===========

None

TROUBLE SHOOTING
====

If the command fails, enter the command with *"init=yes"* to cleanup and reset.

AUTHOR
======

Lam Hoang <lhoang@infinera.com>