cms
===

Cloudmesh used cmd5 which provides an easy to use command line and command
shell interface. Hence you can run each command as a sepearte command line,
but you can also start a shell in which you can execute multiple commands one
after another. Furthermore, you can create cloudmesh scripts in a file that if
run via the cloudmesh shell get executed sequentially.


To run the cloudmesh shell you can activate it with the `cms` command. `cms` stands
for cloudmesh shell::

   cms

It will print the banner and enter the shell::

   +-------------------------------------------------------+
   |   ____ _                 _                     _      |
   |  / ___| | ___  _   _  __| |_ __ ___   ___  ___| |__   |
   | | |   | |/ _ \| | | |/ _` | '_ ` _ \ / _ \/ __| '_ \  |=
   | | |___| | (_) | |_| | (_| | | | | | |  __/\__ \ | | | |
   |  \____|_|\___/ \__,_|\__,_|_| |_| |_|\___||___/_| |_| |
   +-------------------------------------------------------+
   |                  Cloudmesh CMD5 Shell                 |
   +-------------------------------------------------------+

   cms>

To see the list of commands you can say::

   cms> help

To see the manual page for a specific command, please use::

   help COMMANDNAME

Features
--------

The following highlighted features are available:

-  easy command integration through separate modules
-  multi cloud environments (under development) though cloudmesh-cloud
   plugin
-  openapi integration through cloudmesh-openapi plugin
-  general commands as documented at in the
   `manual <https://cloudmesh.github.io/cloudmesh-manual/>`__ such as
   `admin <manual/cmd5/manual/cmd5/admin.html>`__,
   `banner <manual/cmd5/manual/cmd5/banner.html>`__,
   `clear <manual/cmd5/manual/cmd5/clear.html>`__,
   `echo <manual/cmd5/echo.html>`__,
   `default <manual/cmd5/default.html>`__,
   `info <manual/cmd5/info.html>`__, `pause <manual/cmd5/pause.html>`__,
   `plugin <manual/cmd5/plugin.html>`__,
   `quit <manual/cmd5/quit.html>`__, `shell <manual/cmd5/shell.html>`__,
   `sleep <manual/cmd5/sleep.html>`__,
   `stopwatch <manual/cmd5/stopwatch.html>`__,
   `sys <manual/cmd5/sys.html>`__, `var <manual/cmd5/var.html>`__,
   `version <manual/cmd5/version.html>`__,
   `open <manual/cmd5/open.html>`__, and others

Execution shell command
~~~~~~~~~~~~~~~~~~~~~~~~

You can execute shell commands when the beginning character is ! ::

   cms !pwd
   cms shell pwd

Timers
~~~~~~

To switch timers on or off you can use::

   cms set timer=on

Than every command you type is timed::

   cms banner hallo
   banner
   ######################################################################
   # hallo
   ######################################################################
   Timer: 0.0011s (banner hallo)

Variables
~~~~~~~~~

you can store variables with::

   cms var a=1

or::

   cms set a=1

you can access them on the commandline with::

   var.a
   $a

Thus if you type::

   cms banner var.a

or::

   cms banner $a

it will print the variable value in a banner

You can list all variables with::

   var list

OS Variables can also be integrated. ``os.HOME`` will be replaced with
the HOME variable from the shell, try it with::

    cms banner os.HOME

Defaults
~~~~~~~~

Defaults are variables with a context in which the default applies. For
example we can set default images for a cloud. General defaults are
placed in the context ``general``. To set the default cloud you can
use::

   cms default cloud=kilo

To List the defaults use::

    cms default list

.. todo:: cmd5 default - add the ability to define the defaults also with a . notation.

          cms default chameleon.image="ubuntu"

          here the key is image, the context is aws and the value is ubuntu19.04

To use the defaults in a command proceed it with the the keyword
``default.`` and append the context and the name of the default
variable. If the context is missing, the ``general`` context will be
used. Examples::

   banner default.cloud
   default image=ubuntu --context=chameleon
   banner default.chameleon.image


Stopwatch
~~~~~~~~~

For some benchmarks this could be helpful. Naturally in an interactive
shell you will not be able to measure reliably as you also measure the
response time of the user, but in case you use cloudmesh scripts this
could be a great good way for you to customize your benchmarks. We
even provide convenient integration for pytests and you can see in our
special pytest section how to use the stopwatch from within pytests.

Here is an example for a script::

   stopwatch start g
   stopwatch stop g
   stopwatch print g

Then execute::

   cat s.cm | cms

You will get something like this::

   cat s.cm | cms

   +-------------------------------------------------------+
   |   ____ _                 _                     _      |
   |  / ___| | ___  _   _  __| |_ __ ___   ___  ___| |__   |
   | | |   | |/ _ \| | | |/ _` | '_ ` _ \ / _ \/ __| '_ \  |
   | | |___| | (_) | |_| | (_| | | | | | |  __/\__ \ | | | |
   |  \____|_|\___/ \__,_|\__,_|_| |_| |_|\___||___/_| |_| |
   +-------------------------------------------------------+
   |                  Cloudmesh CMD5 Shell                 |
   +-------------------------------------------------------+
   cms> Timer g started ...
   cms> Timer g started ...
   cms> Timer g: 0.000274181365967 s


Cmd5 has even a convenient benchmark print command that not only prints all timers, but includes some
information about your machine on which you run the benchmarks. You can get this information with::

    cms stopwatch benchmark

Accessing Python
~~~~~~~~~~~~~~~~

You can access python in a commandline while using the prefix py::

   cms py 1 + 1
   2

Or redirectiong the python output to a cloudmesh variable as part of the set command::

  cms set a=\"py 1 + 1\"
  a='2'



Accessing Shell Commands
~~~~~~~~~~~~~~~~~~~~~~~~

You can access shell commands while starting a line with !::


  cms \!pwd


or you can use it as part of a variable assignment::


  cms set a=\!pwd


Accessing the yaml file
~~~~~~~~~~~~~~~~~~~~~~~

You can read values from a yaml configuration file in `~/.cloudmesh/cloudmesh.yaml`::


  cms set a=cloudmesh.profile.user


where it is defined as::

  cloudmesh:
  profile:
    user: gregor


Plugins
-------

Cmd5 comes with a sophisticated plugin mechanism. Commands can be
readily designed with the help of  sys command.

The sys command can be installed either from source (as discussed
previously) or via pip

.. code:: bash

   pip install cloudmesh-sys

Once you have installed it, execute ``cms help sys`` to see the usage.
Now you simply can in a new directory execute the sys command as
follows, where ``mycommnad`` is than name of the command you like to
implement.

.. code:: bash

   mkdir mycommand
   cd mycommand
   cms sys command generate mycommand

A directory with the name ``cloudmesh-mycommand`` will be generated that
contains the template for the command. You can enter this template and
modify the implementation in the folders ``cloudmesh/mycommand/api`` and
``cloudmesh/mycommand/command`` when installing it with

.. code:: bash

   pip install .

The command will be added to the cms command>

An example for the bar command is presented at:

-  `cloudmesh/bar/command/bar.py
   <https://github.com/cloudmesh/cloudmesh.bar/blob/master/cloudmesh/bar/command/bar.py>`
   
It shows how simple the command definition is (bar.py):

.. code:: python

   from __future__ import print_function
   from cloudmesh.shell.command import command
   from cloudmesh.shell.command import PluginCommand

   class BarCommand(PluginCommand):

       @command
       def do_bar(self, args, arguments):
           """
           ::
          
             Usage:
                   command -f FILE
                   command FILE
                   command list
             This command does some useful things.
             Arguments:
                 FILE   a file name
             Options:
                 -f      specify the file
           """
           print(arguments)

An important difference to other CMD solutions is that our commands can
leverage (besides the standard definition), docopts as a way to define
the manual page. This allows us to use arguments as dict and use simple
if conditions to interpret the command. Using docopts has the advantage
that contributors are forced to think about the command and its options
and document them from the start. Previously we used not to use docopts
and argparse was used. However we noticed that for some contributions
the lead to commands that were either not properly documented or the
developers delivered ambiguous commands that resulted in confusion and
wrong usage by the users. Hence, we do recommend that you use docopts.

The transformation is enabled by the ``@command`` decorator that takes
also the manual page and creates a proper help message for the shell
automatically. Thus there is no need to introduce a separate help method
as would normally be needed in CMD.

.. |DOI| image:: https://zenodo.org/badge/82920490.svg
   :target: https://zenodo.org/badge/latestdoi/82920490
.. |Version| image:: https://img.shields.io/pypi/v/cloudmesh-cmd5.svg
   :target: https://pypi.python.org/pypi/cloudmesh-cmd5
.. |License| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://github.com/cloudmesh/cloudmesh-cmd5/blob/master/LICENSE
.. |Python| image:: https://img.shields.io/pypi/pyversions/cloudmesh-cmd5.svg
   :target: https://pypi.python.org/pypi/cloudmesh-cmd5
.. |Format| image:: https://img.shields.io/pypi/format/cloudmesh-cmd5.svg
   :target: https://pypi.python.org/pypi/cloudmesh-cmd5
.. |Status| image:: https://img.shields.io/pypi/status/cloudmesh-cmd5.svg
   :target: https://pypi.python.org/pypi/cloudmesh-cmd5
.. |Travis| image:: https://travis-ci.com/cloudmesh/cloudmesh-cmd5.svg?branch=master
   :target: https://travis-ci.com/cloudmesh/cloudmesh-cmd5


Docker
------

Developers can easily create a docker container.

.. todo:: docker cmd5 - make sure this is working

Cloudmesh can be run easily in a container with the help of docker. A
Dockerfile is provided as an example that you may adapt for your needs

To use the docker file we have included a number or convenient targets
also in our makefile.

You can create the image with

.. code:: bash

   make image

You can run teh image and enter a shell with

.. code:: bash

   make shell

This allows you to try things out in the image from bash which is good
for development and debugging. You can directly enter the cloudmesh
shell ``cms`` with

.. code:: bash

   make cms

or say


.. warning:: The docker image is not yet updated.


.. code:: bash

   docker run -it cloudmesh/cmd5:1.0

It will create a default .cloudmesh/cloudmesh.yaml file which your would
have to modify. The reason we have not mounted the yaml file in the make files
form your directory is that we need a clean image to test the initial
setup.

If you have an example on how to mount the yaml file please let us know
and we add it here.

