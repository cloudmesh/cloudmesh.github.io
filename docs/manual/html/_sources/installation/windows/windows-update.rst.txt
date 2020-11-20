User Update
============

::

    pip install cloudmesh-openstack -U

while replacing the openstack with the cloudmesh bundle you wan t to install

Developer Reinstall
===================

.. warning:: Make sure to close all windows and programs and editors that relate to
              cloudmesh or the ENV3 directory as windows does not properly erase files
              that are in use.

Please be very careful when doing this as it removes files and directories

::

   rmdir /s ENV3
   python -m venv ENV3
   python --version
   # Python 3.8.2 or newer
   pip install pip -U

   ENV3\Scripts\activate
   mkdir cm
   cd cm
   pip install-cloudmesh-installer
   cloudmesh-installer get openstack

or if you like to use ssh instead of https, please replace the last line with

   cloudmesh-installer get --ssh openstack
