Reference Card
==============

We present here a number of frequently used commands. for a complete
list, please use::

  cms help

Shell invocation
----------------

.. list-table:: Shell
   :widths: 25 75
   :header-rows: 1

   * - Command
     - Description
   * - cms help
     - help
   * - cms man
     - manual pages
   * - cms script.cm
     - execute cm commands in script

Shell basic commands
--------------------

.. list-table:: Shell
   :widths: 25 75
   :header-rows: 1

   * - Command
     - Description
   * - cms color on
     - sets the shell color
   * - cms color off
     - switches off the color
   * - cms set a=xyx
     - declares a variable
   * - cms set username=cloudmesh.profile.username
     - reads the variable from the cloudmesh.yaml file
   * - cms set time=now
     - gets the time and store it in the variable time
   * - cms set debug=True
     - activates debug messages
   * - cms set trace=True
     - activates traceback on an error to show which line of teh code the
       error occured
   * - cms set verbose=10
     - set maximum verbosity for printing verbose debug messages

Cloud commands
--------------

.. list-table:: Cloud
   :widths: 25 75
   :header-rows: 1

   * - Command
     - Description
   * - cms image list
     - list images
   * - cms flavor list
     - list flavors
   * - cms vm list
     - list vms
   * - cms vm boot
     - boot vm
   * - cms vm boot --cloud=aws
     - boots a  vm on cloud aws
   * - cms set cloud=aws
     - set the default cloud to kilo
   * - cms set refresh=True
     - automatic refresh from the clouds
   * - cms set refresh=Fasle
     - data is only read from the database.

