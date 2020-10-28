group
=====

.. parsed-literal::

    Usage:
        group list [GROUPNAME] [--format=FORMAT]
        group remove NAMES [--group=GROUPNAME]
        group add NAMES [--type=TYPE] [--group=GROUPNAME] [--format=FORMAT]
        group delete GROUPS
        group copy FROM TO
        group merge GROUPA GROUPB MERGEDGROUP

    manage the groups

    Arguments:

        NAMES        names of object to be added
        GROUPS       names of a groups
        FROM         name of a group
        TO           name of a group
        GROUPA       name of a group
        GROUPB       name of a group
        MERGEDGROUP  name of a group

    Options:
        --format=FORMAT     the output format [default: table]
        --type=TYPE         the resource type
        --name=NAME         the name of the group
        --id=IDS            the ID(s) to add to the group


    Description:

        cloudmesh can manage groups of resources. Operations can be
        performed on these groups including termination of services that
        are registered with the group.

        A default group can be set with the command

          cms set group=GROUPNAME

        where GROUPNAME is the group to which all future resources be
        added. The group can also be set as part of other commands with
        the --group=GROUPNAME option.


    Example:
        set group=mygroup

        group add --type=vm --id=albert-[001-003]
            adds the vms with the given name using the Parameter
            see base

        group add --type=vm
         adds the last vm to the group

        group delete --name=mygroup
            deletes all objects in the group
