FAQ - Cloudmesh
===============

Where is the manual
-------------------

A Manual is available at

-  https://cloudmesh.github.io/cloudmesh-manual

Having control over your computers
----------------------------------

Cloudmesh is easy to install, but we have seen issues with the following
that you must solve yourself:

1. Virus checkers switch on that prevent instalation of programs and
   containers
2. Computers managed by a workplace with stricter security rules.

Any of these cases are up to you to find out and solve. We have tested
CMS on an operationg system that was downloaded stright from Microsoft
and verofied it works.



Install MongoDB
~~~~~~~~~~~~~~~

Uninstall older versions of mongo, as they may be incompatible

then install mongo with

   cms admin mongo install

Do an update of the source
~~~~~~~~~~~~~~~~~~~~~~~~~~

::

   pip install cloudmesh-installer -U
   cloudmes-installer get clone cloud
   cms help
   cms gui quick
   cms test 
   cms init

Interact with Chameleon CLoud
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

   cms test
   cms gui quick
   cms key list --cloud=chameleon

remove all keys you see with::

   cms key delete NAMEOFTHEKEY --cloud=chameleon

::

   cms key list
   cms key upload --cloud=chameleon
   cms image --refresh
   cms vm --refresh
   cms vm boot
   cms vm --refresh
   cms vm log
   cms vm ssh 

Draft: Cms Mostly automated install on macOS and Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note: Use at your own risk

If you di not understand line by line what this does you should not
execute it Verify correctnett works on linux and OSX, I have this not
yet tested on gitbash, on windows you must remove the mongo install line
and have cl, mongo, gitbash previously installed.

You must have used ssh-keygen to generate the key before

Install Python:

Save in file install-python.sh

::

   #! /bin/sh -x
   rm -rf ~/ENV3
   rm -rf ~/cm/cloudmesh-common 
   rm -rf ~/cm/cloudmesh-cmd5 
   rm -rf ~/cm/cloudmesh-sys
   rm -rf ~/cm/cloudmesh-configuration
   rm -rf ~/cm/cloudmesh-test 
   rm -rf ~/cm/cloudmesh-gui 
   rm -rf ~/cm/cloudmesh-cloud 
   rm -rf ~/cm/cloudmesh-openstack
   rm -rf ~/cm/cloudmesh-inventory 
   rm -rf ~/cm/cloudmesh-openstack
   rm -rf ~/.cloudmesh
   python3.8 -m venv ~/ENV3
   echo "Please activate your Virtual Environment"
   echo "    source ~/ENV3/bin/activate"

Save in file install-cms.sh and change values::

   #! /bin/sh -x
   pip install pip -U

   pip install cloudmesh-installer -U
   mkdir cm
   cd cm
   cloudmesh-installer get openstack
   cms set cloud=chameleon
   cms help 
   cms debug off

   #cms test # its in your responsiblity to fix this this test may not work yet properly

   cms config set cloudmesh.data.mongo.MONGO_AUTOINSTALL=True

   #cms config set cloudmesh.profile.email=TBD@gmail.com
   #cms config set cloudmesh.profile.firstname=TBD
   #cms config set cloudmesh.profile.lastname=TBD
   #cms config set cloudmesh.profile.github=TBD
   #cms config set cloudmesh.profile.user=TBD

   #cms config set cloudmesh.cloud.chameleon.credentials.auth.username=TBD
   #cms config set cloudmesh.cloud.chameleon.credentials.auth.password=TBD
   cms config set cloudmesh.cloud.chameleon.credentials.auth.project_id=7767f9aac3c143de8b1f0e6acc70f159
   cms config set cloudmesh.cloud.chameleon.default.network=e01ee12e-fd22-4b21-a050-d3e015f42bb1

   cms config set cloudmesh.data.mongo.MONGO_PASSWORD=TBD
   rm -rf ~/.cloudmesh/cloudmesh.yaml.bak.*

   cms admin mongo install

   #cms test

   cms gui quick # Set your Mongo username = `admin` and password what you want.
   sleep 2
   cms init
   sleep 2

   # LET US NOW ASSUME YOU HAVE IN cloiudmes.profile.user=xyz

   Replace xyz with what you have in profile
   cms key delete xyz --cloud=chameleon
   cms key upload xyz --cloud=chameleon
   cms key list 
   cms key list --cloud=chameleon

   cms vm list --refresh

To use it do the following::

   chmod a+x install-cms.sh install-python.sh
   ./install-python.sh
   source ~/ENV3/bin/activate
   ./install-cms.sh
   cms vm boot

Switching between cms and cmsd
------------------------------

It is best to delete the .cloudmesh directory and start new.

However you can also try to set the MONGO mode accordingly.

For cms you use::

   cms config set cloudmesh.data.mongo.MODE=native

For cmsd you use

::

   cmsd config set cloudmesh.data.mongo.MODE=running

Remeber that cmsd will automatically upon –setup change the mode to
running. So if you like to switch back do so.

Please be aware there coudl be issues with Mongo runing natively or in a
container. Try it out. IF it does not work, remove the .cloudmesh
directory
