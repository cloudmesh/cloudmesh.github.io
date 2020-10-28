Windows Cloudmesh Ubuntu Subsystem Environment
==============================================

It is trivial to set up cloudmesh on Windows when leveraging the Ubuntu
subsystem. First you need to install the Linux subsystem from

-  https://docs.microsoft.com/en-us/windows/wsl/install-win10

Next you launch the Ubuntu 18.04TLS image from the Microsoft App store

-  `Ubuntu
   18.04 <https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6?rtc=1&activetab=pivot:overviewtab>`__

Once you have started the Ubuntu subsystem, you need to execute the
following to update to a new version of python. We want to use python
3.7.4:

::

   sudo apt update
   sudo apt install -y make
   sudo apt install -y emacs
   sudo apt install -y git
   sudo apt install -y software-properties-common
   sudo add-apt-repository -y ppa:deadsnakes/ppa
   sudo apt install -y python3.7
   python -m venv ENV3 --without-pip
   curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   python get-pip.py --user
   python3.7 --version
   pip --version

Setup git
---------

Next configure your github identity. It is important you do this or your
may not get proper credit as we obtain user information form github

.. code:: bash

   git config --global user.name "user_name"
   git config --global user.email "email_id"
   git config --global core.editor emacs

.bashrc
-------

At the end of your .bashrc place the following lines so that your
environment will be always activated when you start a new ubuntu
terminal.

::

   emacs ~/.bashrc

Add the following line to it so whenever you start the the ubuntu shell,
it just jumps right into your development directory and replace user
with your username

::

   # the default ls has some uggly colors, so lets improve this
   export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
   # lets us make python 3.7 available via python
   alias python='python3.7'
   # let us cd to the cloudmesh working directory upon login 
   cd /mnt/c/Users/<USER>/cm                                                     
   # set ENV3 to be the default python
   alias ENV3="source ~/ENV3/bin/activate"
   ENV3

Pycharm different terminal
--------------------------

go to ``Settings->tools->terminal``

original:

::

   cmd.exe

gitbash:

::

   "C:\Users\USERNAME\AppData\Local\Programs\Git\bin\sh.exe " –login -i

ubuntu:

::

   C:\Users\<my_user>\AppData\Local\Microsoft\WindowsApps\ubuntu.exe

cloudmesh-installer
-------------------

-  Next we install an easy ``cloudmesh-installer`` program that we use
   to clone the cloudmesh repositories

   .. code:: bash

      pip install cloudmesh-installer

-  Let us check out the needed repositories. Cloudmesh is distributed in
   bundles for development. One of the most comprehensive bundles is the
   ``storage`` bundles. Let us clone it with

   .. code:: bash

      mkdir cm
      cd cm
      cloudmesh-installer git clone storage

-  Do a ``dir`` and you will see something like

   ::

      (ENV3) C:\Users\yourname\cm>dir
       Volume in drive C has no label. 
       Volume Serial Number is B215-C79C

       Directory of C:\Users\blue\cm

      05/13/2019  12:09 PM    <DIR>          .
      05/13/2019  12:09 PM    <DIR>          ..
      05/13/2019  12:06 PM    <DIR>          cloudmesh-box
      05/13/2019  12:06 PM    <DIR>          cloudmesh-cloud
      05/13/2019  12:06 PM    <DIR>          cloudmesh-cmd5
      05/13/2019  12:06 PM    <DIR>          cloudmesh-common
      05/13/2019  12:06 PM    <DIR>          cloudmesh-inventory
      05/13/2019  12:06 PM    <DIR>          cloudmesh-manual
      05/13/2019  12:06 PM    <DIR>          cloudmesh-storage
      05/13/2019  12:06 PM    <DIR>          cloudmesh-sys
                     0 File(s)              0 bytes
                    11 Dir(s)  965,946,884,096 bytes free

If you like to explore other bundles, you can do this with

::

   (ENV3) C:\Users\blue\cm>cloudmesh-installer bundles

Which will return you a list of the different development combinations.
Please note that they are here just for developer convenience and you do
not have to think about which bundles you need. Get in contact with us
to find out mor. We even can create you a custom bundle. If you are a
user, you naturally will be able to use a pip install once the package
has been released and the dependencies will be discovered automatically.

::

   cms:
           cloudmesh-common cloudmesh-cmd5 cloudmesh-sys cloudmesh-manual
   cloud:
           cloudmesh-common cloudmesh-cmd5 cloudmesh-sys cloudmesh-cloud
           cloudmesh-inventory cloudmesh-manual
   batch:
           cloudmesh-common cloudmesh-cmd5 cloudmesh-sys cloudmesh-cloud
           cloudmesh-inventory cloudmesh-batch cloudmesh-manual
   storage:
           cloudmesh-common cloudmesh-cmd5 cloudmesh-sys cloudmesh-cloud
           cloudmesh-storage cloudmesh-inventory cloudmesh-box cloudmesh-manual
   source:
           cloudmesh-common cloudmesh-cmd5 cloudmesh-sys cloudmesh-cloud
           cloudmesh-storage cloudmesh-inventory cloudmesh-emr cloudmesh-comet
           cloudmesh-openapi cloudmesh-nn cloudmesh-nist cloudmesh-conda
           cloudmesh-azure cloudmesh-aws cloudmesh-box cloudmesh-redshift
           cloudmesh-manual
   web:
           about get cloudmesh-github.io cloudmesh-manual
   community:
           cloudmesh-community.github.io
   flow:
           cloudmesh-common cloudmesh-cmd5 cloudmesh-sys cloudmesh-cloud
           cloudmesh-inventory cloudmesh-flow cloudmesh-manual
   emr:
           cloudmesh-common cloudmesh-cmd5 cloudmesh-sys cloudmesh-cloud
           cloudmesh-inventory cloudmesh-emr cloudmesh-manual
   conda:
           cloudmesh-conda
   all:
           cloudmesh-box cloudmesh-cloud cloudmesh-cmd5 cloudmesh-common
           cloudmesh-inventory cloudmesh-manual cloudmesh-storage cloudmesh-sys
   cloudmesh:
           cloudmesh-box cloudmesh-cloud cloudmesh-cmd5 cloudmesh-common
           cloudmesh-inventory cloudmesh-manual cloudmesh-storage cloudmesh-sys

Development with pyCharm
------------------------

Pycharm is a great editor with many features. It is worthwhile to spend
some time with it and explore. Please install pycharm ``community``
edition from

-  https://www.jetbrains.com/pycharm/download/

Start it up and say Open Project. Locate the ``cm`` directory and open
it. All repositories will be imported and you can use them for
development.

Next we want to configure the python interpreter. Go to

-  ``File->Settings->Project:cm->Project Interpreter``

Click on project interpreter and select ``All`` add the interpreter with
the location

-  ``C:\USers\yourusername\venv``

It will add your interpreter to pycharm

Github use
----------

cloudmesh-installer is best used with ssh keys. Generate one in the
terminal while saying

::

   ssh-keygen

It is very important that you do not create a password less key out of
security reasons. If we find out you do, you will get all repository
access revoked in case you have write access. Look at the public key
with in gitbash

::

   $ cat ~/.ssh/id_rsa.pub

and upload the key to

-  https://github.com/settings/keys

As you can directly commit from pycharm you can set up git hub access
also in pycharm.

Git Pull requests
-----------------

In case you do not have direct access to github cloudmesh, you can
create yourself a local clone and create pull requests. Please note it
is of utmost important that you do not wait for 10 weeks with your pull
request, we want to see your git updates on a weekly basis.

Compiling the code
------------------

To avoid compiling the code all the time you can visit each directory
and issue the command

::

   pip install -e .

or you can apply it an a bundle with

::

   cloudmesh-installer install storage -e

where we assume that your bundle is storage. This will take quire a
while as we install lots of libraries to give you access to lots of
clouds.

To see if this installed cloudmesh you can do

.. code:: bash

   cms help
