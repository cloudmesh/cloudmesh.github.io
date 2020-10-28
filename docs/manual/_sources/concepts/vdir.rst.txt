Virtual Directory
=================

The virtual directory has been developed to mirror the linux directory
commands. File links in the virtual directory point to files on storage
providers, which can be retrieved using the virtual directory.

The credentials for the virtual directory are the same as for the admin
mongo command. See the Mongo section for details.


PyTest
~~~~~~~

The vdir command can be tested as follows:

.. code:: bash

   $ pytest -v --capture=no tests/test_vdir.py

Google drive
------------

The Google Drive API needs the following two 2 credentials files. \*
`client_secret.json` \* `google-drive-credentials.json`

If we run the Google Drive `Provider.py` for the **First time** then
the required keys, tokens are taken from the `cloudmesh.yaml` file and
creates a `client_secret.json` file in the following path
`~/.cloudmesh/gdrive/`

The `Authentication.py` creates a `.credentials` folder under the
following path `~/.cloudmesh/gdrive/` if it does not exist and creates
a `google-drive-credentials.json` file under the following folder
`~/.cloudmesh/gdrive/.credentials/`

So, for the **First time** browser will be opened up automatically and
asks for the Google Drive(gmail) credentials i.e., login email and
password. If you provide these 2 then the Authentication step is
completed and then it will create the `google-drive-credentials.json`
and place it in `~/.cloudmesh/gdrive/.credentials/` folder.

These steps are to be followed for the first time or initial run. Once
it is done then our program is set. After these steps then the program
will run automatically by using these credentials stored in the
respective files.

Note
~~~~

The Google Drive API accepts these 2 files in the form of **.json file
format** and not in the form of a dictionary.

Links
~~~~~

Link for additional information:

* <https://github.com/cloudmesh-community/sp19-516-130/blob/master/gdrive.md>

.. |Version| image:: https://img.shields.io/pypi/v/cloudmesh-storage.svg
   :target: https://pypi.python.org/pypi/cloudmesh-storage
.. |License| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://github.com/cloudmesh/cloudmesh-storage/blob/master/LICENSE
.. |Python| image:: https://img.shields.io/pypi/pyversions/cloudmesh-storage.svg
   :target: https://pypi.python.org/pypi/cloudmesh-storage	    
.. |Format| image:: https://img.shields.io/pypi/format/cloudmesh-storage.svg
   :target: https://pypi.python.org/pypi/cloudmesh-storage
.. |Travis| image:: https://travis-ci.com/cloudmesh/cloudmesh-storage.svg?branch=master
   :target: https://travis-ci.com/cloudmesh/cloudmesh-storage
