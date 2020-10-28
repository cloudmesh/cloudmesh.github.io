Windows Cloudmesh Development Environment
=========================================

It is trivial to set up cloudmesh on Windows.

For development we recommend that you do not use conda,but regular
python. conda has lots of features that we will not use and do not want
to rely on. Especially when we develop for containers or th cloud where
we do not want to waste storage space of hundreds of packages that we
will never use.

Here our recommended install

-  install emacs as it is a real good editor, that you may want to use

   -  make sure to add a shortcut to runemacs so you can start it
      quickly

-  install gitforwindows from

   -  https://gitforwindows.org

   Make sure to select an editor that you are comfortable with for
   commenting on your commits. (As lots of us like emacs, you can now
   see why we installed emacs first).

-  Now install python from

   -  https://www.python.org/downloads/

-  Next we create a python virtual environment so we do not effect your
   local python install. This is real important.

   .. code:: bash

      python -m venv ENV3

-  in every terminal in which you work, you need to make sure you start
   this environment with

   .. code:: bash

      ENV3\Scripts\activate.bat  

   So please do it now. You will see an ``(ENV3)`` at the beginning of
   the prompt, so it is easy to see that you have done it.

-  Now, let us update pip

   .. code:: bash

      pip install --user pip -U

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

Makefile
--------

-  Install Linux subsystem
-  Install ubuntu

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
