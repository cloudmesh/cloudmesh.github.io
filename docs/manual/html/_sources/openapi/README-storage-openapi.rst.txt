Cloudmesh Multi Cloud Open API Interface
========================================

Cloudmesh-storage also provides an OpenAPI specification that allows
users to run the multi cloud storage services using a single REST
service in addition to the command line interface.

The REST service is developed independent of the storage service
provider and users can switch between providers by setting the
``storage`` variable as follows:

.. code:: bash

   $ cms set storage='azureblob'

Note: ``azureblob`` can be replaced with the desired service in the
above command.

To invoke the server, navigate to the OpenAPI folder in the
cloudmesh-storage directory and use:

.. code:: bash

   $ cms openapi server start ./openapi_storage.yaml

to start up the server on the default address and port. Once the server
is started all cloudmesh-storage functions can be accessed using the
following endpoints.

.. code:: bash

   http://localhost:8080//cloudmesh/storage/v1/put
   http://localhost:8080//cloudmesh/storage/v1/get
   http://localhost:8080//cloudmesh/storage/v1/list
   http://localhost:8080//cloudmesh/storage/v1/search
   http://localhost:8080//cloudmesh/storage/v1/delete
   http://localhost:8080//cloudmesh/storage/v1/create_dir

All of the options described in the ``cloudmesh-storage`` section are
available in the OpenAPI specification as arguments. For example, to
list the files from a specific directory on the service, the following
URL can be visited:

.. code:: bash

   http://localhost:8080/cloudmesh/storage/v1/list?service={storage}&directory=%2fapitest&recursive=True

Pytests
-------

A generic pytest is also developed which is available in the following
directory

-  https://github.com/cloudmesh/cloudmesh-storage/tree/master/cloudmesh/storage/spec/tests

The generic pytest that works across providers and can be invoked as
follows

.. code:: bash

   $ cms set storage=azureblob
   $ pytest -v --capture=no tests/test_openapi_storage.py

   $ cms set storage=box
   $ pytest -v --capture=no tests/test_openapi_storage.py

   $ cms set storage=gdrive
   $ pytest -v --capture=no tests/test_openapi_storage.py

   $ cms set storage=awss3
   $ pytest -v --capture=no tests/test_openapi_storage.py
