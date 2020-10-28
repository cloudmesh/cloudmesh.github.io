analytics
=========

.. parsed-literal::

    Usage:
        analytics help FUNCTION
        analytics manual SERVICE
        analytics codegen function FILENAME --service=NAME
            [--dir=DIR]
            [--port=PORT]
            [--host=HOST]
        analytics codegen sklearn MODEL --service=NAME
            [--port=PORT]
            [--dir=DIR]
            [--host=HOST]
        analytics server start --service=NAME
            [--cloud=CLOUD]
            [--dir=DIR]
            [--detached]
        analytics server stop SERVICE [--service=NAME] [--cloud=CLOUD]
        analytics file put SERVICE FILENAME [--cloud=CLOUD] [--port=PORT]
        analytics file list SERVICE [--cloud=CLOUD] [--port=PORT]
        analytics file get SERVICE FILENAME [--cloud=CLOUD] [--port=PORT]
        analytics file run SERVICE PARAMETERS... FILENAME [--cloud=CLOUD] [--port=PORT] [-v]
        analytics run SERVICE PARAMETERS... [--cloud=CLOUD] [--port=PORT] [-v]
        analytics SERVICE [--cloud=CLOUD] [--port=PORT] [-v]

    This command manages the cloudmesh analytics server on the given cloud.
    If the cloud is not spified it is run on localhost

    Options:
        --cloud=CLOUD  The name of the cloud as specified in the
                        cloudmesh.yaml file

        --dir=DIR      The directory in which the service is to be
                       placed [default=./build]

        --port=PORT    The port of the service [default=8000]

        --host=HOST    The hostname to run this server on
                       [default=127.0.0.1]

        --service=NAME   The name of the service (should than not just
                            be name?)

    Arguments:

        SERVICE  the name of the service
        PARAMETERS  the PARAMETERS to be send toy the service

    Description:

       http://127.0.0.1:8000/cloudmesh/LinearRegression/ui/

    Examples:

       cms analytics manual LinearRegression
       cms analytics help LinearRegression
       cms analytics help sklearn.linear_model.LinearRegression
