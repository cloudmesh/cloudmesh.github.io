ssh
===

.. parsed-literal::

    Usage:
        ssh
        ssh config list [--output=OUTPUT]
        ssh config add NAME IP [USER] [KEY]
        ssh config delete NAME
        ssh host delete NAME
        ssh host add NAME
        ssh [--name=VMs] [--user=USERs] [COMMAND]

    Arguments:
      NAME        Name or ip of the machine to log in
      list        Lists the machines that are registered and
                  the commands to login to them
      PARAMETERS  Register te resource and add the given
                  parameters to the ssh config file.  if the
                  resource exists, it will be overwritten. The
                  information will be written in /.ssh/config

    Options:
       -v                verbose mode
       --output=OUTPUT   the format in which this list is given
                         formats includes cat, table, json, yaml,
                         dict. If cat is used, it is just printed as
                         is. [default: table]
       --user=USERs      overwrites the username that is
                         specified in ~/.ssh/config
       --name=CMs        the names of the VMS to execute the
                         command on

    Description:
        ssh config list
            lists the hostsnames that are present in the
            ~/.ssh/config file

        ssh config add NAME IP [USER] [KEY]
            registers a host i ~/.ssh/config file
            Parameters are attribute=value pairs
            Note: Note yet implemented

        ssh [--name=VMs] [--user=USERs] [COMMAND]
            executes the command on the named hosts. If user is
            specified and is greater than 1, it must be specified for
            each vm. If only one username is specified it is used for
            all vms. However, as the user is typically specified in the
            cloudmesh database, you probably do not have to specify
            it as it is automatically found.

    Examples:


         ssh config add blue 192.168.1.245 blue

             Adds the following to the !/.ssh/config file

             Host blue
                  HostName 192.168.1.245
                  User blue
                  IdentityFile ~/.ssh/id_rsa.pub
