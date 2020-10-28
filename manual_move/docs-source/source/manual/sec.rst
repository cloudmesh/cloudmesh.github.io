sec
===

.. parsed-literal::

    Usage:
        sec rule list [--cloud=CLOUDS] [--output=OUTPUT]
        sec rule add RULE FROMPORT TOPORT PROTOCOL CIDR
        sec rule delete RULE [--cloud=CLOUD]
        sec group list [--cloud=CLOUDS] [--output=OUTPUT]
        sec group add GROUP RULES DESCRIPTION
        sec group delete GROUP [--cloud=CLOUD]
        sec group load [GROUP] [--cloud=CLOUD]
        sec list [--output=OUTPUT]
        sec load
        sec clear

    Options:
        --output=OUTPUT Specify output format, in one of the following:
                        table, csv, json, yaml, dict
                        [default: table].
        --cloud=CLOUD   Name of the IaaS cloud e.g. kilo,chameleon.
                        The clouds are defined in the yaml file.
                        If the name "all" is used for the cloud all
                        clouds will be selected.
    Arguments:
        RULE          The security group rule name
        GROUP         The label/name of the security group
        FROMPORT      Staring port of the rule, e.g. 22
        TOPORT        Ending port of the rule, e.g. 22
        PROTOCOL      Protocol applied, e.g. TCP,UDP,ICMP
        CIDR          IP address range in CIDR format, e.g.,
                      129.79.0.0/16

    Examples:
        # sec load
        # sec group list
        # sec group add my_new_group webapp 8080 8080 tcp 0.0.0.0/0


    Bugs:
        # sec group list --cloud=chameleon
        # seg group delete my_group my_rule
        # sec group delete my_unused_group --cloud=kilo
        # sec group upload --cloud=kilo



    Description:


       Database commands:

           sec clear
               removes all rules and groups from the database

           sec load
                loads some default security groups and rules in the
                database

            sec clear
                deletes all security groups and rules in the database

            sec rule list  [--output=OUTPUT]
                lists all security groups and rules in the database

            sec rule add RULE FROMPORT TOPORT PROTOCOL CIDR
                adds a security rule with the given group and the details
                of the security rules

            sec group add GROUP RULES DESCRIPTION
                adds a security group with the given group and the
                details of the security groups

            sec rule delete RULE
                deletes the rule form the database

            sec group delete GROUP
                deletes the group form the database


        Cloud commands:

            sec rule list --cloud=CLOUDS [--output=OUTPUT]
                lists all security rules in the specified cloud

            sec group list --cloud=CLOUDS [--output=OUTPUT]
                lists all security groups in the specified cloud

            sec rule delete RULE --cloud=CLOUD
                deletes the rule form the cloud

            sec group delete GROUP [--cloud=CLOUD]
                deletes the group from the cloud

            sec load GROUP --cloud=CLOUD
                uploads the group to the cloud with all its rules
