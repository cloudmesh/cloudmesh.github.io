Installation for macOS
======================

Prerequisites for macOS
------------------------

You want a number of useful tools on your macOS. They are not installed by
default, but are available via Xcode. First you need to install xcode from

* https://apps.apple.com/us/app/xcode/id497799835

You need to install macOS xcode command line tools

.. code-block:: bash

   xcode-select --install

Next you want to install a python version. You can either chose the installation
from python.org or from homebrew.

Next make sure you update your python version and go to

* https://www.python.org/downloads/

to download the version you require. Wer recommend to use 3.8.2 or newer. Cloudmesh
can also installed in anaconda, but you will have to use pip to install it in
it. Please see the instructions fro anaconda.



Prerequisite venv
-----------------

You can chose your location and name of your venv, but throughout the
documentation we refer to it as ENV3

.. code-block:: bash

   python3 -m venv ~/ENV3
   source ~/ENV3/bin/activate
   pip install pip -U

.. include:: ../install-generic.rst

Installation Diagram
-------------------

We provide an easy to follow instalation diagram to showcase how simple the installation for cloudesh is

.. mermaid::

   graph TD
      A(Prerequisite) --> xcode(xcode-select --install)
      xcode --> python(Python 3.7, 3.8, or 3.9)
      python --> venv
      venv --> pip(pip install pip -U)
      pip --> install(Prerequisite completed)
      key --> install
      xcode --> keygen(ssh-keygen)
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

      style xcode fill:gainsboro,stroke:#333,stroke-width:2px
      style keygen fill:gainsboro,stroke:#333,stroke-width:2px
      style dev fill:gainsboro,stroke:#333,stroke-width:2px
      style user fill:gainsboro,stroke:#333,stroke-width:2px
      style container fill:gainsboro,stroke:#333,stroke-width:2px
      style setup fill:gainsboro,stroke:#333,stroke-width:2px
      style setupd fill:gainsboro,stroke:#333,stroke-width:2px
      style cms fill:gainsboro,stroke:#333,stroke-width:2px
      style cmsd fill:gainsboro,stroke:#333,stroke-width:2px
      style pip fill:gainsboro,stroke:#333,stroke-width:2px



