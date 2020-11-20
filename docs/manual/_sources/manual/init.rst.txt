init
====

.. parsed-literal::

    Usage:
        init [CLOUD] [--debug]
        init yaml

    Description:

        Initializes cloudmesh while using data from
        ~/.cloudmesh/cloudmesh.yaml.

        If no cloud is specified a number of local collections are
        created. If a cloud is specified it also uploads the
        information about images, flavors, vms. It also uploads the
        security groups defined by default to the cloud.

    Bug:

        cms init
        cms init

            On Windows you have to run the cms init command twice upon
            first installation
