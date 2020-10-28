Installation for for Linux
=========================

We describe here the various choices for the installation of cloudmesh on linux. We focus
on Ubuntu but you are able to adopt them easily for other versions of Linux
including CentOS, RedHat, and Linux Mint. You can contribute these instructions to us.

Please read the document first, before you copy and paste, as there are
differences between the installs for regular users, container users and developers.

Prerequisites for Ubuntu 20.4
------------------------------

.. code-block:: bash

   python3 -m venv ~/ENV3
   source ~/ENV3/bin/activate
   pip install pip -U

In case you want to install Python 3.9.0 you can use

.. code-block:: bash

    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt-get install python3.9
    sudo apt-get install python3.9-venv
    sudo apt-get install python3.9-dev
    python3.9 --version
    python3.9 -m venv ~/ENV3
    source ~/ENV3/bin/activate
    pip install pip -U


Prerequisites for Ubuntu 18.04
-------------------------------

We recommend you switch to Ubuntu 20.04. However if you can not do this please
follow these steps.

We first need to make sure that the correct version of the Python3 is
installed. The default version of Python on Ubuntu 18.04 is 3.6. You can get
the new version with

.. code-block:: bash

   sudo apt-get -y update
   sudo apt-get -y install openssl curl
   sudo apt-get install software-properties-common
   sudo add-apt-repository ppa:deadsnakes/ppa
   sudo apt-get install python3.8 python3-dev python3.8-dev
   python3.8 -m venv --without-pip ~/ENV3
   source ~/ENV3/bin/activate
   curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
   python get-pip.py
   rm get-pip.py


.. include:: ../install-generic.rst

Installation Diagram
-------------------

We provide an easy to follow installation diagram

.. mermaid::

   graph TD


      A(Prerequisite) --> python(Python 3.7, 3.8, or 3.9)
      python --> venv
      venv --> pip(pip install pip -U)
      pip --> install(Prerequisite completed)
      key --> install
      A --> keygen(ssh keygen)
      keygen -->key[fa:fa-key Key]
      install --> chose

      chose-->cuser([Container User])
      chose-->nuser([Native User])
      chose-->duser([Developer])

      duser-->dev(pip install cloudmesh-installer<br/>cloudmesh-installer get openstack)
      nuser-->user(pip install cloudmesh-openstack)
      cuser--> idocker(Install Docker)
      idocker--> container(pip install cloudmesh-cmsd)

      setup(cms help<br/>cms admin mongo install<br/>cms --gui quick<br/>cms init)
      dev-->setup
      user-->setup
      container-->setupd(cmsd --setup)

      setup-->cms
      setupd-->cmsd

      style keygen fill:gainsboro,stroke:#333,stroke-width:2px
      style dev fill:gainsboro,stroke:#333,stroke-width:2px
      style user fill:gainsboro,stroke:#333,stroke-width:2px
      style container fill:gainsboro,stroke:#333,stroke-width:2px
      style setup fill:gainsboro,stroke:#333,stroke-width:2px
      style pip fill:gainsboro,stroke:#333,stroke-width:2px
