% networks(1) Version 1.0 
NAME
====

**networks** — XR Network Management

SYNOPSIS
========

| **networks** **command** init=yes|no intent=userIntentFileName system_profile=systemDataPath profile=userProfileName** 

DESCRIPTION
===========

Depending on the *command*, the**networks** function shall create, update, or delete the XR network.

 1. Using the environment variable *DEFAULT_HELLO_DEDICATION*
 2. Using the per-user configuration file, *~/.hellorc*
 3. Using the system-wide configuration file, */etc/hello.conf*
 4. Finally, using "world".

Arguments
-------

1. command : the support commands are
   1.  create:
   2.  update:
   3.  delete:
2. init=yes|no. This will remove the state files and execute the *"terraform init"* before the *terraform apply* 
3. intent=userIntentFile
4. profile=userProfile
5. system_profile=systemDataPath


:   Prints brief usage information.

-o, --output

:   Outputs the greeting to the given filename.

    The file must be an **open(2)**able and **write(2)**able file.

-v, --version

:   Prints the current version number.

FILES
=====

*~/.hellorc*

:   Per-user default dedication file.

*/etc/hello.conf*

:   Global default dedication file.

ENVIRONMENT
===========

**DEFAULT_HELLO_DEDICATION**

:   The default dedication if none is given. Has the highest precedence
    if a dedication is not supplied on the command line.

BUGS
====

See GitHub Issues: <https://github.com/[owner]/[repo]/issues>

AUTHOR
======

Foobar Goodprogrammer <foo@example.org>