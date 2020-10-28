Installation for Container Users
--------------------------------

.. code-block:: bash

    pip install cloudmesh-cmsd
    cmsd --setup

Installation for Users
-----------------------

.. code-block:: bash

    pip install cloudmesh-openstack
    cms help
    cms gui quick
    cms admin mongo install
    source ~/.bashrc # on linux, source ~/.zprofile on OSX or start a new
                     # terminal and execute the next commands in the new terminal
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
    source ~/.bashrc # on linux, source ~/.zprofile on OSX or start a new
                     # terminal and execute the next commands in the new terminal
    cms init

Please note that the cloudmesh installer uses by default https. It can also use
ssh and you would than use the following instead:

.. code-block:: bash

    mkdir ~/cm
    cd ~/cm
    pip install cloudmesh-installer
    cloudmesh-installer get --ssh openstack
    cms help
    cms gui quick
    cms admin mongo install
    source ~/.bashrc # on linux, source ~/.zprofile on OSX or start a new
                     # terminal and execute the next commands in the new terminal
    cms init
