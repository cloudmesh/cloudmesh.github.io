provider
========

.. parsed-literal::

   Usage:
     provider list [--output=OUTPUT]
     provider info SERVICE NAME WHAT

   Arguments:
     NAME           The name of the key.

   Options:
      --output=OUTPUT               the format of the output [default: table]


   Description:

        What: output, sample

   Examples:
     Getting the sample and output from provides via a command

       cms provider info compute openstack sample
       cms provider info compute openstack output
       cms provider list --output=json
       cms provider list
