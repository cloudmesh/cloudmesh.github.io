ip
==

.. parsed-literal::

    Usage:
        ip list  [--cloud=CLOUD] [--output=OUTPUT]
        ip create [N] [--cloud=CLOUD]
        ip delete [IP] [--cloud=CLOUD]
        ip attach [NAME] [IP]
        ip detach [NAME] [IP]


    Options:
        -h                          help message
        --cloud=CLOUD               Name of the cloud
        --output=OUTPUT             The output format [default: table]

    Arguments:
        N         Number of IPS to create
        IP        IP Address
        NAME      Name of the service


    Description:
        ip list floating [--cloud=CLOUD] [--output=OUTPUT]
            returns a list of all the floating IPS in the cloud

        ip add floating [--cloud=CLOUD]
            adds a floating ip to the pool of available floating ips

        ip delete floating [IP] [--cloud=CLOUD]
            deletes a floating ip to the pool of available
            floating ips

        ip add NAME [IP]
            add the ip to the named vm

        ip delete NAME [IP]
            deletes the ip from the vm
