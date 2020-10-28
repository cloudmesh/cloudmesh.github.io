Storage Providers
=================

Cloudmesh supports multiple cloud storage services via storage
providers. You can access them via commandline, an API or REST
services. A simple abstraction layer between cloud services and you
local computer makes it possible that the services are accessed the
same way. This includes Awss3, Azure, Google, and box.

The code is available a cloudmesh module at

* <https://github.com/cloudmesh/cloudmesh-storage>


The instalation is documented in our instalation manual.


Configuration
-------------

The cloudmesh yaml file contains a number of templates for configuring
access to your cloud providers storage services. THis includes AWS,
Azure, Google, and others.


To showcase the integration, please open the
`cloudmesh.yaml` config file. Under the ‘storage’ section, we need to
add the the parameters for authentication.

In the credentials section under aws, specify the access key id and
secret access key which will be available in the AWS console under
`AWS IAM service` -> `Users` -> `Security Credentials`.

Bucket is the default bucket which will be used to store the files in
AWS S3. Region is the geographic area like `us-east-1` which contains
the bucket. Region is required to get a connection handle on the S3
Client or resource for that geographic area.

Here is an example:

.. code:: bash

   cloudmesh:
     ...
     storage:
       aws:
         cm:
           active: True
           heading: aws
           host: aws.amazon.com
           label: aws
           kind: awss3
           version: TBD
           service: storage 
         default:
         credentials:
           access_key_id: *********
           secret_access_key: *******
           bucket: name of bucket that you want user to be contained in.
           region: Specfiy the default region eg us-east-1


Similar to AWS other storage providers are available. Please check in
the yaml file for their configuration template.


Commandline
-----------

	   
The Cloudmesh command line allows to access a directory with the
convenient get, put, search, list, create directory, and delete
functions. To find out more, use the command 

.. code:: bash

   cms> help storage 

To invoke the AWS S3 service, we need to pass awss3 as
parameter to storage parameter.

.. code:: bash

   $ cms storage --storage=aws list '' --run
  

The following command can set the default storage service used in the 
storage command. After this command, you don't need to specify the
`--service` option in some commands.

.. code:: bash

   $ cms set storage=aws

Monitor 
~~~~~~~~

This command monitors the status of commands in mongodb database and 
refresh itself every 5 seconds.

.. code:: bash

   $ cms storage monitor
   
Run
~~~

This command execute the commands in the mongodb that are in waiting 
status.

.. code:: bash
   
   $ cms storage run
   
Clean
~~~~~

This command clean all the actions in mongodb database.

.. code:: bash
   
   $ cms storage clean

Create dir
~~~~~~~~~~

This command helps to create a new directory on AWS S3. You must specify
the full path of the new directory you would like to create.

.. code:: bash

   $ cms storage --storage='aws' create dir /base_path/targetdir --run

Put
~~~

The put command uploads files from your local host to the S3.

.. code:: bash

   $ cms storage --storage='aws' put ~/.cloudmesh/storage/sourcedir /base_path/targetdir --recursive --run

Source for this command could be either a file or directory.

If you specify a file as the source, the file will be uploaded if no
such file exists on the cloud or updated if a copy already exists on the
cloud.

If the source is a directory, you can choose to specify the recursive
option to upload the files in the sub-directories in the source as well
to the target directory in S3. If the recursive option is not specified,
only the files in the source directory will be uploaded to the target
directory and the sub-directories will be ignored.

Get
~~~

The get command downloads files from S3 to your local host.

.. code:: bash

   $ cms storage --storage='aws' get /base_container/sourcedir ~/.cloudmesh/storage/targetdir --recursive --run

Source for this command could be either a file or directory.

If you specify a file as the source, you need to specify the full path
of file including the file name where you want the file to be
downloaded. In case you do not specify the file name and only give the
target directory, then the file will be downloaded with the same name as
present on S3.

If the source is a directory, you can choose to specify the recursive
option to download files in the sub-directories in the source as well to
the target directory in your local host. If the recursive option is not
specified, only the files in the source directory will be downloaded to
the target directory and the sub-directories will be ignored.

Search
~~~~~~

The search command helps to search for a particular file within a
directory.

If recursive options is specified, Cloudmesh will search for the file in
all sub-directories of the original directory as well.

To search for a file at the root, pass an empty string or / as the
target dir.

.. code:: bash

   $ cms storage --storage='aws' search /base_path/targetdir testfile.txt --recursive --run

Note that for the Box storage provider, objects are only indexed every 5
to 10 minutes and will not show up in a search until they have been
indexed.

List
~~~~

The list command lists all the contents of a cloud directory. If the
recursive option is specified, it will list the contents of all
sub-directories as well.

.. code:: bash

   $ cms storage --storage='aws' list /base_path/targetdir --recursive --run

Delete
~~~~~~

The delete command can delete files or folders from your cloud file
storage. Deleting a folder will delete its contents as well (including
the sub-directories).

.. code:: bash

   $ cms storage --storage='aws' delete /base_path/targetdir --run
   
Copy
~~~~

This command can allow user to copy files/directories across local and
different cloud providers including aws, azureblob, gdrive, etc.

.. code:: bash
   
   $ cms storage copy --source=local:./test_file1.txt --target=aws:aws_copy_1.txt --run


Help command gives a detail level understanding of what each command
does and how to use the command line to interact with different object
storage providers and different parameters / options available in a
particular command.

API
~~~

Cloudmesh Storage provides a simple programming API interface that you
can use. We highlight a simple example for storing and retrieving a file
form a storage provider.

We assume the files at the given path exist

.. code:: python

   import cloudmesh.storage.provider.Provider as Provider
   from cloudmesh.common.util import path_expand
   from pprint import pprint

   provider = Provider(service="azure")
   src = path_expand("~/.cloudmesh/storage/test/a/a.txt")
   dst = "/"
   result = provider.put(src, dst)
   # The resut will be a dict of the information which you can print with 

   pprint(result)


Pytests
-------

THe storage providers have a number of pytests that can be used to test the functionality

Generic Tests
~~~~~~~~~~~~~

We have developed a number of simple pytests that can be called. To see
the list of Pytests go to our directory

-  https://github.com/cloudmesh/cloudmesh-storage/tree/master/tests

We also developed a general pytest that works across providers and can
be invoked as follows

.. code:: bash

   $ cms set storage=box
   $ pytest -v --capture=no tests/test_storage.py

   $ cms set storage=azure
   $ pytest -v --capture=no tests/test_storage.py

   $ cms set storage=gdrive
   $ pytest -v --capture=no tests/test_storage.py

   $ cms set storage=aws
   $ pytest -v --capture=no tests/test_storage.py
   
   $ cms set storage=parallelazureblob
   $ pytest -v --capture=no tests/test_storage.py
   
   $ cms set storage=parallelazureblob
   $ pytest -v --capture=no tests/test_storage_azure.py
   
   $ cms set storage=parallelgdrive
   $ pytest -v --capture=no tests/test_storage.py

Provider Specific Pytests
~~~~~~~~~~~~~~~~~~~~~~~~~

Open a terminal and navigate to the cloudmesh-storage directory. Enter
the following command to run pytests:

.. code:: bash

   $ pytest -v --capture=no tests/test_storage_box.py
   $ pytest -v --capture=no tests/test_azure.py
   $ pytest -v --capture=no tests/test_storage_aws.py


Virtual Directory
-----------------

The virtual directory has been developed to mirror the linux directory
commands. File links in the virtual directory point to files on storage
providers, which can be retrieved using the virtual directory.

.. _configuration-1:

Configuration
~~~~~~~~~~~~~

The credentials for the virtual directory are the same as for the admin
mongo command. See the Mongo section for details.

.. _pytests-2:

Pytests
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
