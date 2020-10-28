inventory
=========

.. parsed-literal::

  Usage:
      inventory add NAMES [--label=LABEL]
                          [--service=SERVICES]
                          [--project=PROJECT]
                          [--owners=OWNERS]
                          [--comment=COMMENT]
                          [--cluster=CLUSTER]
                          [--ip=IP]
      inventory set NAMES ATTRIBUTE to VALUES
      inventory delete NAMES
      inventory clone NAMES from SOURCE
      inventory list [NAMES] [--format=FORMAT] [--columns=COLUMNS]
      inventory info

  Arguments:

    NAMES     Name of the resources (example i[10-20])

    FORMAT    The format of the output is either txt,
              yaml, dict, table [default: table].

    OWNERS    a comma separated list of owners for this resource

    LABEL     a unique label for this resource

    SERVICE   a string that identifies the service

    PROJECT   a string that identifies the project

    SOURCE    a single host name to clone from

    COMMENT   a comment

  Options:

     -v       verbose mode

  Description:

        add -- adds a resource to the resource inventory

        list -- lists the resources in the given format

        delete -- deletes objects from the table

        clone -- copies the content of an existing object
                 and creates new once with it

        set   -- sets for the specified objects the attribute
                 to the given value or values. If multiple values
                 are used the values are assigned to the and
                 objects in order. See examples

        map   -- allows to set attributes on a set of objects
                 with a set of values

  Examples:

    cms inventory add x[0-3] --service=openstack

        adds hosts x0, x1, x2, x3 and puts the string
        openstack into the service column

    cms inventory lists

        lists the repository

    cms inventory x[3-4] set temperature to 32

        sets for the resources x3, x4 the value of the
        temperature to 32

    cms inventory x[7-8] set ip 128.0.0.[0-1]

        sets the value of x7 to 128.0.0.0
        sets the value of x8 to 128.0.0.1

    cms inventory clone x[5-6] from x3

        clones the values for x5, x6 from x3
