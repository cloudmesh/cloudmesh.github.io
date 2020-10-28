Linux Subsystem on Windows 10
=============================

.. warning::  do not install cloudmesh-gui on Linux subsystem as GUIs are not
               sported

.. warning:: MongoDB reports that mongo is not yet working on Linux
	         Subsystem. As cloudmesh uses mongo, please do not yet use
	         the Linux Subsystem install.

To activate the Linux Subsystem, please follow the instructions at

* https://docs.microsoft.com/en-us/windows/wsl/install-win10

A suitable distribution would be

* https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab

However, as it uses an older version of python, you will be required to update it.

Follow this to set a password

* https://askubuntu.com/questions/772050/reset-the-password-in-ubuntu-linux-bash-in-windows


Setup Python::

   sudo apt-get update
   sudo apt install wget curl
   sudo apt install software-properties-common
   sudo add-apt-repository ppa:deadsnakes/ppa
   sudo apt-get install gcc
   sudo apt-get -y install libcurl4 openssl
   sudo apt install python3.7
   sudo apt install python3.7-dev
   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   sudo python3.7 get-pip.py
   sudo apt install python3.7-venv
   python3.7 -m venv ~/ENV3
   rm get-pip.py
   pip install pip -U
   pip install psutil

Check if your system is havving python properly

    >>> platform.uname()
   uname_result(system='Linux', node='DESKTOP',
                 release='4.4.0-18362-Microsoft',
                 version='#1-Microsoft Mon Mar 18 12:02:00 PST 2019',
                 machine='x86_64', processor='x86_64')

   >>> platform.system()
   'Linux'

   >>> platform.version()
   '#1-Microsoft Mon Mar 18 12:02:00 PST 2019'

If you like to use python 3.8.2 (or newer), please follow the instructions provided
for Linux 18.04

Set up Git and replace Gregorsname and e-mail with yours
(only needed for developers)::

   sudo apt install git
   git config --global user.name "Gregor von Laszewski"
   git config --global user.email laszewski@gmail.com
   git config --global core.editor emacs
   git config --list



Installation for Users
-----------------------

.. code-block:: bash

    pip install cloudmesh-openstack
    cms help
    cms gui quick
    cms admin mongo install
    cms init

Installation for Developers
---------------------------

.. code-block:: bash

    mkdir ~/cm
    cd ~/cm
    pip install cloudmesh-installer
    cloudmesh-installer get openstack
    cms help
    cms gui quick
    cms admin mongo install
    cms init



