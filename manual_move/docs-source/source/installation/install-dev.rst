
Installation of Cloudmesh (Source Install for Developers)
---------------------------------------------------------

If you are a developer, we have developed a simple ``cloudmesh-installer``
It conveniently downloads the needed repositories, installs them, and
can also be used to updates them. More documentation about the installer can be
found at

*  <https://github.com/cloudmesh/cloudmesh-installer>

First make sure you have a python ``venv`` created, as described in
the prerequisites for venv section (see `Use a venv`_). Activate the
venv (`ENV3`).

Navigate to for example the home directory, Then create an empty
directory labeled ``cm``, and change into the `cm` directory.

.. code-block:: bash

   mkdir cm
   cd cm

Before beginning the installation, be sure to confirm `pip` is up to date
and install the `cloudmesh-installer`.

.. code-block:: bash

   pip install pip -U
   pip install cloudmesh-installer

After `cloudmesh-installer` has been installed  (while still under the `cm`
directory), run the following command to list the available cloudmesh
`bundles`:

.. code-block:: bash

   cloudmesh-installer list

Once you have decided which bundle to install you can proceed. If you only want
to use compute resources the bundle name ``openstack`` will be what you want.
If in addition you also like to work on storage, the bundle name ``storage``
needs to be used.

Let, us assume you chose `opensatck`, than you can install cloudmesh with

.. code-block:: bash

   cloudmesh-installer get openstack

In case you like to use ssh instead of https as protocol to interact with
GitHub please use instead

.. code-block:: bash

   cloudmesh-installer get --ssh openstack

It will take a while for the install to complete. On newer machines it
takes 1 minute, on older machines, it may take significantly
longer. Please watch your system resource information if the install
takes a long time. Make sure to terminate other resource hungry
programs.  After the installation is complete, you can then test if
you have successfully installed it by issuing the following command:

.. code-block:: bash

    cms help

Not only will you see a list of commands, a directory `~/.cloudmesh` with some
of cloudmesh's default configuration files will be installed. You will need to
modify these files at some point.


Cloudmesh Updates
^^^^^^^^^^^^^^^^^

To update the source from GitHub, simply use the `cloudmesh-installer` command
while making sure to specify the desired bundle name, let us assume you use
``cloud``

.. code-block:: bash

    cloudmesh-installer git pull cloud

If you see any conflicts make sure to resolve them.

Please note that in an update it could also be possible that the format of the
`cloudmesh.yaml` file may have changed. Thus we always recommend that you also
update the yaml file to the newest format. You can check the yaml file with

.. code-block:: bash

    cms config check


As developer sometimes it may be best to make a backup of the `cm` and
`~\.cloudmesh` directory or individual repositories in the cm
directory. Then copy your changes into the newest code. Make sure to
remove all python artifacts in the backup directory the command

.. code-block:: bash

    cd cm
    cloudmesh-installer clean --dir=. --force

Reinstallation
^^^^^^^^^^^^^^

In case you need to reinstall cloudmesh and you have used previously the
`cloudmesh-installer`, you can do it as follows (We assume you have used venv
and the `cloudmesh-installer` in the directory cm as documented previously):

.. code-block:: bash

    cd cm # the directory where your source locates
    cloudmesh-installer clean --dir=. --force
    cloudmesh-installer clean --ENV=~/ENV3 --force
    python3 -m venv ~/ENV3
    pip install pip -U
    pip install cloudmesh-installer
    cloudmesh-installer get openstack
    cms help

or if yo like to use ssh instead of https

.. code-block:: bash

    cd cm # the directory where your source locates
    cloudmesh-installer clean --dir=. --force
    cloudmesh-installer clean --ENV=~/ENV3 --force
    python3 -m venv ~/ENV3
    pip install pip -U
    pip install cloudmesh-installer
    cloudmesh-installer get --ssh openstack
    cms help
