Cloudmesh API Namespace
=======================

Cloudmesh uses the python package namespace feature to allow the definition of
plugins to cloudmesh in different packages maintained in different files and
directories.

This is an important feature as it allows us to have contributions developed
for cloudmesh by different developers.


At thsi time we support the namespace `cloudmesh` and any module developed with
the cloudmesh command generator can be installed into this namespace. The
command generator simple creates a template for a plugin with the needed setup,
requirements file and code template to be aple to be installed with pip.

You create a new plugin with::

    mkdir cloudmesh-mycommand
    cd cloudmesh-mycommand
    cms sys command generate mycommand .

Notice the dot at the end. This will generate than a directory such as::

    cloudmesh-mycommand
    ├── LICENSE
    ├── Makefile
    ├── README.md
    ├── VERSION
    ├── cloudmesh
    │   ├── __init__.py
    │   └── mycommand
    │       ├── __init__.py
    │       ├── __version__.py
    │       ├── api
    │       │   ├── __init__.py
    │       │   └── manager.py
    │       └── command
    │           ├── __init__.py
    │           └── mycommand.py
    ├── requirements-dev.txt
    ├── requirements.txt
    ├── setup.cfg
    └── setup.py

Important is that is includes a file `cloudmesh/command/mycommand.py` which you
can modify and use to create your own `mycommand` plugin.

However, `mycommand` must not be an existing cloudmesh command which you can
find out by usung the `cms help` function and communicate with Gregor von
Laszewski to verify that the command is not already taken.

How to create and design commands are discussed in the cmd5 manual pages. When
you look atthe generated command you will see it is very simple.
