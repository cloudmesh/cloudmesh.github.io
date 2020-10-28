image
=====

.. parsed-literal::

    Usage:
        image list [NAMES] [--cloud=CLOUD] [--refresh] [--output=OUTPUT] [--query=QUERY]

    Options:
       --output=OUTPUT  the output format [default: table]
       --cloud=CLOUD    the cloud name
       --refresh        live data taken from the cloud

    Description:
        image list
        image list --cloud=aws --refresh
        image list --output=csv
        image list 58c9552c-8d93-42c0-9dea-5f48d90a3188 --refresh
