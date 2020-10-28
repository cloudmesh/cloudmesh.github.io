Cloudmesh cmsd
==============

Cloudmesh ``cmsd`` is a command to run cloudmesh in a container
regardless of the OS. Thus it is extremely easy to install and use in
case your machine has docker installed.

``cmsd`` uses the locally installed keys in ``~/.ssh`` and typically
cloud configurations stored in ``~/.cloudmesh/cloudmesh.yaml``. This
YAML file is created upon the first call of ``cmsd`` if it is not
available.

Prerequesites
~~~~~~~~~~~~~

-  Docker
-  Python 3.8 or newer
-  We strongly recommended using a python virtual environment
-  ssh public key in ``~/.ssh/id_rsa.pub``

How to use ``cmsd``
-------------------

Important. You must have cms in debug off mode. to use the cmsd command

.. code:: bash

   $ cms debug off

User installation
~~~~~~~~~~~~~~~~~

Please use a python virtualenv as to not interfere with your system
python and activate your python venv.

Linux, osx:

.. code:: bash

   $ python3.8 -m venv ~/ENV3
   $ source ~/ENV3/bin/activate
   $ pip install pip -U

In Windows, you can do this with

.. code:: bash

   $ python -m venv ENV3
   $ ENV3\Scripts\activate
   $ pip install pip -U 

Now you can install cloudmesh ``cmsd`` with

.. code:: bash

   $ pip install cloudmesh-openstack

Developer Source installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Developers install ``cmsd`` from source with our ``cloudmesh-installer``
after they created a venv just as any other user does.

.. code:: bash

   # make sure you use a venv
   $ mkdir cm
   $ cd cm  
   $ pip install cloudmesh-installer -U 
   $ cloudmesh-installer get cmsd


You will see in the ``cm`` directory a number of cloudmesh related
repositories. One of them is ``cloudmesh-cmsd`` in which the cmsd
command related code is stored. The other repositories contain code that
may be used by ``cloudmesh-cmsd``.

Default setup
~~~~~~~~~~~~

To run ``cmsd``, you need a configuration directory that is mounted into
the container. The default setup is done with

.. code:: bash

   $ cmsd --setup

This will set up a number of configurations including a cloudmesh
configuration YAML file in

-  masOS and Linux: ``~/.cloudmesh/cloudmesh.yaml``
-  Windows ``%USERPROFILE%\.cloudmesh\cloudmesh.yaml``

You are asked to enter some details that are required for the setup,
such as profile details.

Custom cmsd setup
~~~~~~~~~~~~~~~~~

In case you need to place the configuration files elsewhere you can
specify the location with the environment variable
``CLOUDMESH_CONFIG_DIR``.

For macOS and Linux you set it with

.. code:: bash

   $ export CLOUDMESH_CONFIG_DIR=<path to CLOUDMESH_HOME_DIR>

For Windows you set it with

.. code:: bash

   > set CLOUDMESH_CONFIG_DIR=<path to CLOUDMESH_HOME_DIR>

.. note:: avoid spaces:

   ``CLOUDMESH_CONFIG_DIR`` path must not have in any spaces in it. For
   example ``C:\.cloudmesh`` will work, so does
   ``C:\Users\gregor\.cloudmesh``, but not
   ``C:\Users\gregor von Laszewski\.cloudmesh``, as it includes a space
   in th eusername.

.. note:: grant access:

   Make sure that the drive of the ``CLOUDMESH_CONFIG_DIR`` is granted
   file access in Docker settings

Next, you run the setup. If you are running setup on an empty
``CLOUDMESH_CONFIG_DIR``, you will be asked to
enter some details that are required for the setup, such as profile
details, Mongo DB credentials.

.. code:: bash

   $ cmsd --setup 

This setup will do most everything automatically and create and start two containers
for running cloudmesh. The
containers are called

-  ``cloudmesh-cms`` for the cms command
-  ``cloudmesh-mongo`` for the mongodb that is used by cms

Run the command

.. code:: bash

   $ cmsd --ps

to see if the containers are running. Additionally, check
``CLOUDMESH_CONFIG_DIR`` or ~/.cloudmesh contains the ``cloudmesh.yaml``
file, dependent where you asked ``cmsd`` to look for it.

Commands
~~~~~~~~

To list the containers, please use

.. code:: bash

   $ cmsd --ps

Run the following to verify if the configurations you entered have been
properly reflected in the ``cloudmesh.yaml`` file.

.. code:: bash

   $ cmsd config cat

To initialize the cloudmesh database use

.. code:: bash

   $ cmsd init

To test if things are working use

.. code:: bash

   $ cmsd key list 

To stop the containers use

.. code:: bash

   $ cmsd --stop

To start the containers use

.. code:: bash

   $ cmsd --start

To remove the containers use

.. code:: bash

   $ cmsd --clean

To login to the container via a shell use

.. code:: bash

   $ cmsd --shell

Example Usecase - Creating a vm in Chameleon Cloud
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To modify the parameters use the command

.. code:: bash

   cmsd --gui quick

and make sure the MongoDB MODE is set to ``running``. This is
automatically done by the setup. Make sure you add your username and
password, as well as the network id and the project id and name. Test if
it works with

.. code:: bash

   cmsd flavor list --refresh

Example Usecase - Creating a vm in AWS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create an AWS account and add the authentication information in the
``CLOUDMESH_HOME_DIR/cloudmesh.yaml`` file. Please see the `Cloudmesh
Manual -
AWS <https://cloudmesh.github.io/cloudmesh-manual/accounts/aws.html>`__
form more details about AWS.

Set the cloud to ``aws``

.. code:: bash

   $ cmsd set cloud=aws 

.. code:: bash

   $ cmsd key upload --cloud=aws

where the key name is specified by

.. code:: bash

   cms var key

or

.. code:: bash

   cms config get cloudmesh.profile.user

or

Make sure you have an ssh key generated prior to booting a vm with the
default configuration with

.. code:: bash

   $ cmsd vm boot 

MongoDB and Mongo client connections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``cmsd`` is running an official MongoDB container from
`DockerHub <https://hub.docker.com/_/mongo>`__.

The Mongo server container is bound to ``127.0.0.1:27071``. You can use
use any Mongo client to explore the database by connecting to this port.

Manual Page
-----------

.. code:: bash

     Usage:
       cmsd --help
       cmsd --setup
       cmsd --clean
       cmsd --version
       cmsd --update
       cmsd --start
       cmsd --stop
       cmsd --ps
       cmsd --gui COMMAND...
       cmsd --shell
       cmsd --pipe
       cmsd COMMAND...


     This command passes the arguments to a docker container
     that runs cloudmesh.

     Arguments:
         COMMAND the commands we bass along

     Description:

       cmsd --help

           prints this manual page

       cmsd --setup

           downloads the source distribution, installs the image locally

       cmsd --clean

           removes the container form docker

       cmsd --version

           prints out the version of cmsd and the version of the container

       cmsd --update

           gets a new container form dockerhub

       cmsd --start

           starts the mongodb

       cmsd --stop

           stops the mongodb

       cmsd --ps

           lists the container processes

       cmsd --gui help

           find out which gui commands are available

       cmsd --gui quick

           runs cloudmesh gui on the docker container

       cmsd --shell

           enters the cms container and starts an interactive shell

       cmsd --pipe

           You can pipe commands or scripts to the cmsd container

               echo "banner a" | cmsd --pipe

       cmsd COMMAND

           The command will be executed within the container, just as in
           case of cms.

       cmsd

           When no command is specified, cmsd will be run in interactive
           mode.

Quickstart
----------

macOS with python 3.8.2 from python.org
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use python version 3.8.2 or newer

1. Requirements:

   -  Have a username without a space.
   -  Have docker installed and accessible to the user.
   -  Have python 3.8.2 or newer from python.org installed.
   -  Create a key ``~/.ssh/id_rsa`` if you do not already have one

   .. code:: bash

      $ ssh-keygen

2. Install:

   In a new terminal execute

   .. code:: bash

      $ python3.8 -m venv ~/ENV3
      $ source ~/ENV3/bin/activate
      $ pip install cloudmesh-cmsd
      $ cmsd --setup
      $ cmsd init
      $ cmsd help

   Output:

   ::

      Documented commands (type help <topic>):
      ========================================
      EOF       config     help       man        quit      ssh        vcluster      
      admin     container  host       open       register  start      version       
      aws       data       image      openstack  sec       stop       vm            
      azure     debug      info       pause      service   stopwatch  workflow_draft
      banner    default    init       plugin     set       sys      
      check     echo       inventory  provider   shell     test     
      clear     flavor     ip         py         sleep     var      
      commands  group      key        q          source    vbox 

   Testing banner command:

   .. code:: bash

      $ cmsd banner hello

   Output:

   ::

      banner
      ######################################################################
      # hello
      ######################################################################

   Testing sec command:

   .. code:: bash

      $ cmsd sec rule list

   Output:

   ::

      +-------+----------+-----------+-----------+
      | Name  | Protocol | Ports     | IP Range  |
      +-------+----------+-----------+-----------+
      | ssh   | tcp      | 22:22     | 0.0.0.0/0 |
      | icmp  | icmp     |           | 0.0.0.0/0 |
      | flask | tcp      | 8000:8000 | 0.0.0.0/0 |
      | http  | tcp      | 80:80     | 0.0.0.0/0 |
      | https | tcp      | 443:443   | 0.0.0.0/0 |
      +-------+----------+-----------+-----------+

Demonstration of the different uses of cmsd
-------------------------------------------

1. Commandline

   .. code:: bash

      $ cmsd banner hallo

      banner
      ######################################################################
      # hello
      ######################################################################

2. Pipe

   ::

      $ echo "banner hello" | cmsd --pipe

      +-------------------------------------------------------+
      |   ____ _                 _                     _      |
      |  / ___| | ___  _   _  __| |_ __ ___   ___  ___| |__   |
      | | |   | |/ _ \| | | |/ _` | '_ ` _ \ / _ \/ __| '_ \  |
      | | |___| | (_) | |_| | (_| | | | | | |  __/\__ \ | | | |
      |  \____|_|\___/ \__,_|\__,_|_| |_| |_|\___||___/_| |_| |
      +-------------------------------------------------------+
      |                  Cloudmesh CMD5 Shell                 |
      +-------------------------------------------------------+

      cms> banner
      ######################################################################
      # hello
      ######################################################################   ```

3. Interactive

   ::

      $ cmsd
      start cms interactively

      +-------------------------------------------------------+
      |   ____ _                 _                     _      |
      |  / ___| | ___  _   _  __| |_ __ ___   ___  ___| |__   |
      | | |   | |/ _ \| | | |/ _` | '_ ` _ \ / _ \/ __| '_ \  |
      | | |___| | (_) | |_| | (_| | | | | | |  __/\__ \ | | | |
      |  \____|_|\___/ \__,_|\__,_|_| |_| |_|\___||___/_| |_| |
      +-------------------------------------------------------+
      |                  Cloudmesh CMD5 Shell                 |
      +-------------------------------------------------------+

      cms> banner hello
      banner
      ######################################################################
      # hello
      ######################################################################
      cms> quit

4. Access container shell for development

   .. code:: bash

      $ cmsd --shell

      root@docker-desktop:/cm# ls -1
      cloudmesh-aws
      cloudmesh-azure
      cloudmesh-cloud
      cloudmesh-cmd5
      cloudmesh-common
      cloudmesh-configuration
      cloudmesh-inventory
      cloudmesh-openstack
      cloudmesh-sys
      cloudmesh-test
      root@docker-desktop:/cm# 
