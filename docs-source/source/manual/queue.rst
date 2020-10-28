queue
=====

.. parsed-literal::

  Usage:
    queue create --name=NAME --policy=POLICY --cloud=CLOUD
        [--charge=CHARGE]
        [--unit=UNIT]
    queue activate --cloud=CLOUD --queue=NAME
    queue deactivate --cloud=CLOUD --queue=NAME
    queue set --cloud=CLOUD --queue=QUEUE --param=PARAM --val=VALUE
    queue list clouds
    queue list queues --cloud=CLOUD
    queue list jobs --queue=QUEUE
    queue remove --name=NAME


  Arguments:
      FILE   a file name
      INPUT_TYPE  tbd

  Options:
      --depth=DEPTH   [default: 1]
      --format=FORMAT    [default: table]

  Description:

    This command creates a queue that is associated with a cloud.
    Each queue is associated with a cluster and can have several jobs
    in it.
    It is possible to get the list of the jobs in a queue either
    based on the queue name or based on the cluster name with which
    the queue is interacting.

  Examples:
