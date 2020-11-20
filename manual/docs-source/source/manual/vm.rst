vm
==

.. parsed-literal::

    Usage:
        vm ping [NAMES] [--cloud=CLOUDS] [--count=N]
        vm check [NAMES] [--cloud=CLOUDS] [--username=USERNAME]
        vm status [NAMES] [--cloud=CLOUDS] [--output=OUTPUT]
        vm console [NAME] [--force]
        vm log [NAME] [--force]
        vm stop [NAMES]  [--dryrun]
        vm start [NAMES] [--dryrun]
        vm terminate [NAMES] [--cloud=CLOUD] [--dryrun]
        vm delete [NAMES] [--cloud=CLOUD] [--dryrun]
        vm refresh [--cloud=CLOUDS]
        vm list [NAMES]
                [--cloud=CLOUDS]
                [--output=OUTPUT]
                [--refresh]
                [--short]
        vm boot [--n=COUNT]
                [--name=NAMES]
                [--label=LABEL]
                [--cloud=CLOUD]
                [--username=USERNAME]
                [--image=IMAGE]
                [--flavor=FLAVOR]
                [--size=SIZE]
                [--network=NETWORK]
                [--public]
                [--secgroup=SECGROUP]
                [--group=GROUP]
                [--key=KEY]
                [--dryrun]
                [-v]
        vm meta list [NAME]
        vm meta set [NAME] KEY=VALUE...
        vm meta delete [NAME] KEY...
        vm script [NAMES]
                  [--username=USERNAME]
                  [--key=KEY]
                  [--dryrun]
                  [--dir=DESTINATION]
                  SCRIPT
        vm ip assign [NAMES]
                  [--cloud=CLOUD]
        vm ip show [NAMES]
                   [--group=GROUP]
                   [--cloud=CLOUD]
                   [--output=OUTPUT]
                   [--refresh]
        vm ip inventory [NAMES]
        vm ssh [NAMES]
               [--username=USER]
               [--quiet]
               [--ip=IP]
               [--key=KEY]
               [--command=COMMAND]
        vm put SOURCE DESTINATION [NAMES]
        vm get SOURCE DESTINATION [NAMES]
        vm rename [OLDNAMES] [NEWNAMES] [--force] [--dryrun]
        vm wait [--cloud=CLOUD] [--interval=INTERVAL] [--timeout=TIMEOUT]
        vm info [NAMES] [--cloud=CLOUD] [--output=OUTPUT] [--dryrun]
        vm username USERNAME [NAMES] [--cloud=CLOUD]
        vm resize [NAMES] [--size=SIZE]

    Arguments:
        OUTPUT         the output format
        COMMAND        positional arguments, the commands you want to
                       execute on the server(e.g. ls -a) separated by ';',
                       you will get a return of executing result instead of login to
                       the server, note that type in -- is suggested before
                       you input the commands
        NAME           server name. By default it is set to the name of last vm from database.
        NAMES          server name. By default it is set to the name of last vm from database.
        KEYPAIR_NAME   Name of the vm keypair to be used to create VM. Note this is
                       not a path to key.
        NEWNAMES       New names of the VM while renaming.
        OLDNAMES       Old names of the VM while renaming.

    Options:
        -v             verbose, prints the dict at the end
        --output=OUTPUT   the output format
        -H --modify-knownhosts  Do not modify ~/.ssh/known_hosts file
                              when ssh'ing into a machine
        --username=USERNAME   the username to login into the vm. If not
                              specified it will be guessed
                              from the image name and the cloud
        --ip=IP          give the public ip of the server
        --cloud=CLOUD    give a cloud to work on, if not given, selected
                         or default cloud will be used
        --count=COUNT    give the number of servers to start
        --detail         for table, a brief version
                         is used as default, use this flag to print
                         detailed table
        --flavor=FLAVOR  give the name or id of the flavor
        --group=GROUP          give the group name of server
        --secgroup=SECGROUP    security group name for the server
        --image=IMAGE    give the name or id of the image
        --key=KEY        specify a key to use, input a string which
                         is the full path to the private key file
        --keypair_name=KEYPAIR_NAME   Name of the vm keypair to
                                      be used to create VM.
                                      Note this is not a path to key.
        --user=USER      give the user name of the server that you want
                         to use to login
        --name=NAME      give the name of the virtual machine
        --force          rename/ delete vms without user's confirmation
        --command=COMMAND
                         specify the commands to be executed


    Description:
         commands used to boot, start or delete servers of a cloud

         vm default [options...]
             Displays default parameters that are set for vm boot either
             on the default cloud or the specified cloud.

         vm boot [options...]
             Boots servers on a cloud, user may specify flavor, image
             .etc, otherwise default values will be used, see how to set
             default values of a cloud: cloud help

         vm start [options...]
             Starts a suspended or stopped vm instance.

         vm stop [options...]
             Stops a vm instance .

         vm delete [options...]

             Delete servers of a cloud, user may delete a server by its
             name or id, delete servers of a group or servers of a cloud,
             give prefix and/or range to find servers by their names.
             Or user may specify more options to narrow the search

         vm floating_ip_assign [options...]
             assign a public ip to a VM of a cloud

         vm ip show [options...]
             show the ips of VMs

         vm ssh [options...]
             login to a server or execute commands on it

         vm list [options...]
             same as command "list vm", please refer to it

         vm status [options...]
             Retrieves status of last VM booted on cloud and displays it.

         vm refresh [--cloud=CLOUDS]
             this command refreshes the data for virtual machines,
             images and flavors for the specified clouds.

         vm ping [NAMES] [--cloud=CLOUDS] [--count=N] [--processors=PROCESSORS]
              pings the specified virtual machines, while using at most N pings.
              The ping is executed in parallel.
              If names are specifies the ping is restricted to the given names in
              parameter format. If clouds are specified, names that are not in
              these clouds are ignored. If the name is set in the variables
              this name is used.

         cms vm ssh --command="uname -a"

               executes the uname command on the last booted vm

         vm script [--name=NAMES]
                   [--username=USERNAME]
                   [--key=KEY]
                   [--dryrun]
                   [--dir=DESTINATION]
                   [--shell=SHELL]
                   SCRIPT

            The script command copies a shell script to the specified vms
            into the DESTINATION directory and than execute it. With
            SHELL you can set the shell for executing the command,
            this coudl even be a python interpreter. Examples for
            SHELL are /bin/sh, /usr/bin/env python

         vm put SOURCE DESTINATION [NAMES]

             puts the file defined by SOURCE into the DESINATION folder
            on the specified machines. If the file exists it is
             overwritten, so be careful.

         vm get SOURCE DESTINATION [NAMES]

             gets  the file defined by SOURCE into the DESINATION folder
             on the specified machines. The SOURCE is on the remote
             machine. If one machine is specified, the SOURCE is the same
             name as on the remote machine. If multiple machines are
             specified, the name of the machine will be a prefix to the
             filename. If the filenames exists, they will be overwritten,
             so be careful.

      Tip:
         give the VM name, but in a hostlist style, which is very
         convenient when you need a range of VMs e.g. sample[1-3]
         => ['sample1', 'sample2', 'sample3']
        sample[1-3,18] => ['sample1', 'sample2', 'sample3', 'sample18']

      Quoting commands:
         cm vm login gregor-004 --command="uname -a"

      Limitations:

         Azure: rename is not supported
