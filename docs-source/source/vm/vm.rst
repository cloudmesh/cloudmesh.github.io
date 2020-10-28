Virtual Machine Management
==========================

Cloudmesh v4 contains sophisticated virtual machine management services
that makes it easy for the user to manage a large number of virtual
machines across clouds with a uniform naming scheme.

For now we will focus on the command line and shell interface.

Command Line and Shell Interface
--------------------------------

The command line and shell interface to manage virtual machines are
listed next.

::

   vm ping [NAMES] [--cloud=CLOUDS] [N]
   vm check [NAMES] [--cloud=CLOUDS]
   vm refresh [NAMES] [--cloud=CLOUDS]
   vm status [NAMES] [--cloud=CLOUDS]
   vm console [NAME] [--force]
   vm start [NAMES] [--cloud=CLOUD] [--dryrun]
   vm stop [NAMES] [--cloud=CLOUD] [--dryrun]
   vm terminate [NAMES] [--cloud=CLOUD] [--dryrun]
   vm delete [NAMES] [--cloud=CLOUD] [--dryrun]
   vm list [NAMES]
           [--cloud=CLOUDS]
           [--output=OUTPUT]
           [--refresh]
   vm boot [--name=NAME]
           [--cloud=CLOUD]
           [--username=USERNAME]
           [--image=IMAGE]
           [--flavor=FLAVOR]
           [--public]
           [--secgroup=SECGROUPs]
           [--key=KEY]
           [--dryrun]
   vm boot [--n=COUNT]
           [--cloud=CLOUD]
           [--username=USERNAME]
           [--image=IMAGE]
           [--flavor=FLAVOR]
           [--public]
           [--secgroup=SECGROUPS]
           [--key=KEY]
           [--dryrun]
   vm run [--name=NAMES] [--username=USERNAME] [--dryrun] COMMAND
   vm script [--name=NAMES] [--username=USERNAME] [--dryrun] SCRIPT
   vm ip assign [NAMES]
             [--cloud=CLOUD]
   vm ip show [NAMES]
              [--cloud=CLOUD]
              [--output=OUTPUT]
              [--refresh]
   vm ip inventory [NAMES]
   vm ssh [NAMES] [--username=USER]
            [--quiet]
            [--ip=IP]
            [--key=KEY]
            [--command=COMMAND]
            [--modify-knownhosts]
   vm rename [OLDNAMES] [NEWNAMES] [--force] [--dryrun]
   vm wait [--cloud=CLOUD] [--interval=SECONDS]
   vm info [--cloud=CLOUD]
           [--output=OUTPUT]
   vm username USERNAME [NAMES] [--cloud=CLOUD]
   vm resize [NAMES] [--size=SIZE]

Uniform Parameter Management
----------------------------

The parameters across these commands are uniformly managed. Most of the
plural form allow a parameterized specification such as ``a[00-03],a8``
which would result in an array ``["a0", "a1", "a2", "a3", "a8"]``. This
especially applies to clouds as well as virtual machine names.

We distinguish the following parameterized options



:–cloud=CLOUDS: which specifies one or more clouds in parameterized
                fashion

:–names=NAMES: which specifies one or more clouds in parameterized
               fashion

We distinguish the following regular options

:–interval=INTERVAL: a specified interval in seconds

:–output=OUTPUT: The output format: txt, csv, table

:–refresh: To update the state of the vms specified with clouds and
           names

:–username=USERNAME: The username to be used for connecting with the vm

:–quiet: do not print debug messages

:–dryrun: do not execute the command, but just print what would happen

:–ip=IP: specify a public IP

:–key=KEY: start the vm with the keypair name

.. _virtual-machine-management-1:

Virtual machine management
--------------------------

Virtual machines can be

-  Created
-  Started
-  Stopped
-  Suspended
-  Resumed
-  Destroyed

Default behavior such as a key management naming scheme as well as ip
address and security management is conveniently provided

Key management
--------------

Access to the virtual machine is governed by SSH keys. The default key
can be uploaded to the cloud with the key command. The name of the key
in the cloud can be used to associate it with virtual machines so that
this key can be used to log into the VM

Security groups
---------------

A security group acts as a virtual firewall for the instance. When we
launch a instance, we want to attach security Groups for controlling the
traffic in and out of the VM.

Check instances
---------------

To check if the instance can execute ssh commands we need to make sure it is
ready. The wait command waits till the vm is ready, which the check just
performs a test.

::

    cms vm check instance NAMES
    cms vm wait instance NAMES


Command Examples
----------------

.. list-table:: Vm Command
   :widths: 25 75
   :header-rows: 1

   * - Action
     - Command
   * - Start
     - vm start [NAMES] [–cloud=CLOUD] [–dryrun]
   * - Ping
     - vm ping [NAMES] [–cloud=CLOUDS] [N]
   * - Check
     - vm check [NAMES] [–cloud=CLOUDS]
   * - Status
     - vm status [NAMES] [–cloud=CLOUDS]
   * - Login
     - vm ssh [NAME] [–force]
   * - Stop
     - vm stop [NAMES] [–cloud=CLOUD] [–dryrun]
   * - Terminate
     - vm terminate [NAMES] [–cloud=CLOUD] [–dryrun]
   * - Delete
     - vm delete [NAMES] [–cloud=CLOUD] [–dryrun]

Example
-------

.. todo:: the name function is not yet included in cms set

::

    cms set cloud=aws
    cms set counter=0
    cms set name.format="vm-{counter}"

    vm boot
    vm ping
    vm check
    vm status
    vm ssh
    vm stop
    vm start
    vm terminate


# Virtual machine Management

* <http://cloudmesh.github.io/cmd3/man/man.html#vm>
* There is also a newer version of cloudmesh, that we have not
  implemented all of this logic but it uses cmd5

Virtual machines are managed with the vm command




