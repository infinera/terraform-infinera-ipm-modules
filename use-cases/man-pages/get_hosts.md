get-hosts(1) Version 1.0 

NAME
====

**get_hosts** — Get all or specific XR host

SYNOPSIS
========

**get_hosts** id


DESCRIPTION
===========

Get the XR host based on its *Id*. If the *id* is **all**, get all XR hosts in the XR networks.


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
1. get_hosts all 
2. get_hosts id 
```
ENVIRONMENT
===========

None

TROUBLE SHOOTING
====



AUTHOR
======

Lam Hoang <lhoang@infinera.com>