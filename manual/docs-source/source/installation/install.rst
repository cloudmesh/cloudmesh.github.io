Overview
========

.. contents:: :local:

Cloudmesh is easy to install. Dependent on your preferences you can choose an
install from

* pip if you are a Cloudmesh user with experience,
* an installation in containers if you are a user with no experience,
* source install if you are a developer.

Please read the installation section in this manual thoroughly, and understand
the items explained before you install it. Do not just paste and copy the text in
your terminal and execute it as it could have unexpected consequences.
This also helps to decide which installation method is best suited for you.

We are providing a **clickable** map to help you in your decision process which
version to install.

.. mermaid::

   graph LR
        os{OS}

        os-->chose{Chose OS}
        os-->Raspbian
        os-->macOS
        os-->Windows
        os-->Linux
        os-->a

        a-->cmi

        chose-->pip
        chose-->c{Chose}

        Raspbian-->pip

        subgraph Python
            p([3.7, 3.8, conda, jupyter])
            pip(pip install fa:fa-link)
            cmi(cloudmesh-installer fa:fa-link)
        end

        subgraph IoT
            Raspbian(Rasbian fa:fa-link)
        end

        subgraph Developer
            a{Any OS}
        end


        subgraph  OS
            chose
            Linux(Linux fa:fa-link)
            macOS(macOS fa:fa-link)
            Windows(Windows fa:fa-link)
        end

        subgraph Container

            c
            Docker(Docker fa:fa-link)
            cmsd(cmsd fa:fa-link)
        end

        click Raspbian "https://cloudmesh.github.io/cloudmesh-manual/installation/install-pi.html"
        click Windows "https://cloudmesh.github.io/cloudmesh-manual/installation/install-windows.html"
        click Linux "https://cloudmesh.github.io/cloudmesh-manual/installation/install-linux.html"
        click macOS "https://cloudmesh.github.io/cloudmesh-manual/installation/install-macos.html"

        click Docker "https://cloudmesh.github.io/cloudmesh-manual/installation/install-cmsd.html"
        click cmsd "https://cloudmesh.github.io/cloudmesh-manual/installation/install-cmsd.html"
        click pip "https://cloudmesh.github.io/cloudmesh-manual/installation/install-native.html"
        click cmi "https://cloudmesh.github.io/cloudmesh-manual/installation/cloudmesh-installer.html"

        style Container fill:#8fc,stroke:#333,stroke-width:2px
        style OS fill:#eef,stroke:#333,stroke-width:2px
        style Python fill:#2df,stroke:#333,stroke-width:2px


Installation of cloudmesh with Docker
-------------------------------------

Although cloudmesh can just be installed on containers without the use of Python,
it is best if you use cmsd. This is a python program that is designed to manage
the containers and makes use of cloudmesh simple form the command line.

This installation can be conducted on all OSes on which docker and python 3.8.2 or newer  is
installed. Cloudmesh can also be installed with a specialized `cloudmesh-cmsd`
command that is distributed as source and on PyPi.

See  :doc:`../cmsd` for more information.

Installation of Cloudmesn in Python
---------------------------------

On some operating systems, you will need a number of tools installed
on your computer before you can install cloudmesh.  It is important to
full fill these requirements. Please use the clickable map to identify
the OS method you use and follow the link.

.. warning:: Please only continue once you have the Prerequists fulfilled.

Once you have installed the prerequisites on your computer cloudmesh
is also each to install natively in your python virtual environment.
Please note that we do not recommend installing it on your OS
directly, but you **must** use a virtual environment.

.. note::

          We recommend that you use Python `venv` to isolate the
          system Python form the user python. For simplicity we assume
          and document on how to set up a virtual environment in the
          home directory under the directory name `~/ENV3`.


Anaconda and Conda
^^^^^^^^^^^^^^^^^^

Cloudmesh can be installed in anaconda with pip. Please follow our pip
instructions, but make sure you create your own virtualenv with conda and assure
you use python at least 3.8.2.



Python Installation from python.org
"""""""""""""""""""""""""""""""""""

The easiest installation of Python for cloudmesh is to use the installation from
https://www.python.org/downloads. Please, visit the page and follow the
instructions. After this install, you have `python3` available from the
command line. After the installation of Python do the following:

Linux, macOS, Windows gitbash:

.. code:: bash

   $ python3.8 -m venv ~/ENV3
   $ source ~/ENV3/bin/activate
   $ pip install pip -U

.. tip::

    You can add at the end of your `.bashrc` (ubuntu) or `.bash_profile`
    (macOS) file the line so the environment is always loaded.

    .. code-block:: bash

       source ~/ENV3/bin/activate

In Windows CMD, you can do this with

.. code:: bash

   $ python -m venv ENV3
   $ ENV3\Scripts\activate
   $ pip install pip -U

Now you can now install cloudmesh ``cmsd`` with

.. code:: bash

   $ pip install cloudmesh-openstack


In a Linux subsystem, `~/` is the default location, assumed
to be the home directory.  In a windows system, this location is
assumed to be under `C:\Users\USERNAME`.


SSH key
-------

In order for you to use a cloud you will need an ssh key that you use to interact
conveniently with cloud resources. This can be
created from the command line with

.. code-block:: bash

    ssh-keygen

Please make sure to use a passphrase with your key. Anyone telling you to use
a passwordless key is giving you the wrong advice.

First configuration
-------------------
Once installed, test the cloudmesh command and at the same time create
a configuration file. This is done by invoking the ``cms help`` command the first
time. Thus, just type the command

.. code-block:: bash

   cms help

in your terminal. It will create a directory `~/.cloudmesh`
in which you can find the configuration file::

    ~/.cloudmesh/cloudmesh.yaml

To get you started quickly, we are providing some convenient programs that help
you set things up. Use the commands

.. code-block:: bash

    cms gui
    cms init

To set up a default configuration. However, you can also do this from
the command line while using the `config` command in case the `gui`
command is not an option for you::

.. code-block:: bash

    cms config set cloudmesh.profile.user=YOURUSERNAME
    cms set key user=YOURUSERNAME

Alternatively, you can edit and modify the `~/.clloudmesh/cloudmesh.yaml` file.

Cloudmesh comes with cloud service bundles that can be easily
installed using the `pip` command.  Examples include

.. code-block:: bash

   pip install cloudmesh-openstack
   pip install cloudmesh-aws
   pip install cloudmesh-google
   pip install cloudmesh-azure
   pip install cloudmesh-volume
   pip install cloudmesh-storage


The Directory .cloudmesh
------------------------

All cloudmesh related configuration information is stored in the
`.cloudmesh` directory.  In case you want to start fresh, simply
delete that directory and its subdirectories. However, if you need
information from it, make sure you make a backup.

Please note that in this file, you have sensitive information, and it
should never be backed up into GitHub, box, icloud, or other such services.
Keep it on your computer or back it up on a secure encrypted external hard
drive or storage media only you have access to.


Installation of MongoDB
-----------------------

Once you have installed cloudmesh it is easy to install MongoDB with
the build-in MongoDB installer::

    cms admin mongo install

The installation of Mongo is done on the default port, and a version
of mongo is installed in your ~/.cloudmsh directory. If you have other
versions of Mongo on your computer make sure it is the newer one, as
Mongo states, older versions must first completely uninstalled, so
Mongo works properly.



