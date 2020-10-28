Windows
=======
.. warning::

          Before you install make sure that you have an up to date version of
          python installed. We recommend you use 3.8.2 or newer. Python can be
          downloaded and installed from https://www.python.org/downloads/. On
          Windows you may also need to install the C++ commandline build tools
          as some cryptographic libraries need to be recompiled in 3.8.2 or newer. The
          installation of cls is optional and only needed for encryption.

Prerequisites for Windows
-----------------------

First check if any of these commands are not installed. If they are not, please
install them first. To check if they are available use the `where` command to
check  the following commands must return a valid path::

   where cls
   where ssh

.. list-table:: Check and install the prerequisites
   :widths: 20 20 20
   :header-rows: 1

   * - Prerequisite
     - Check in CMD.exe
     - Link for installation document
   * - cls
     - | `C:> where cls`
     - | :doc:`windows-cls`
   * - ssh
     - `C:> where ssh`
     - :doc:`windows-ssh`
   * - python 3.8.2 (or newer), 64 bit
     - `C:> python --version`
     - :doc:`windows-python`

Please also run the check if you have the 64 bit vesrsion of python which must return True::

    `C:> python -c 'import sys;print("%x" % sys.maxsize, sys.maxsize > 2**32)'`




Install
------



          Likely the code will work with earlier versions starting from 3.7.4.
          We know that Python 3.6 has bugs and should not be used. Although
          cloudmesh previously was supported in Python 2.7 and newer, we have
          removed Python 2 as supported platform.


On Windows 10 you can install cloudmesh by either using

* a Windows native installation,
* a Linux Subsystem installation,
* a Docker installation,

approach.

In case you use the docker install you must use use the Professional or the
Educational version of Windows, as the Home edition is not supporting it.



Windows Container Approach
""""""""""""""""""""""""""

The user container for cloudmesh shell is called cmsd (cloudmesh shell docker).
It can be installed with pip as follows

.. code-block:: bash

    pip install cloudmesh-cmsd

Please note that in order for you do develop cloudmesh you need to do this
within the container However we do recommend that Windows developer use the
Windows native cloudmesh approach. However regular user will have a very
transparent acces to cloudmesh as most commands ar just passed along to the
container.

The manual page for cmsd is located at :doc:`../cmsd`


Linux Subsystem Installation Approach
"""""""""""""""""""""""""""""""""""""

See our separate section on this.


venv Setup on Windows CMD.EXE
"""""""""""""""""""""""""""""

On Windows, you run the following command from your home directory at
`C:\Users\USERNAME`:

.. code-block:: bash

  python -m venv ENV3
  source ENV3\Scripts\activate
  python -m pip install --upgrade pip

Next, create a Windows system variable named `ENV3` and update the
variable value to `C:\Users\USERNAME\ENV3\Scripts\activate`.

.. figure:: images/ENV3variable.png
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: Setting the ENV3 variable


Then add the `ENV3` variable name to the Path variable.

.. figure:: images/ENV3addedtoPath.png
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: Add the variable to the path


Lastly, to simplify the `venv` activation call, create a new `ENV3.bat`
file under the default directory, and add the following content to the
file.

.. code-block:: bash

  C:\Users\USERNAME\ENV3\Scripts\activate.bat

.. note:: The same can be done in Windows Powershell by creating a `ENV3.ps1` to
          reference the activation command.

**Test the venv activation**

We recommend  that you test the venv activation. In a command prompt, type
`ENV3` while under the home directory; or if the bat file was not created,
simply reference the system variable %ENV3%.

Example using bat file activation:

.. code-block:: bash

   C:\Users\USERNAME> ENV3

   ...

   (ENV3) C:\Users\USERNAME>


Example using Windows environment variable:

.. code-block:: bash

   C:\Users\USERNAME> %ENV3%

   (ENV3) C:\Users\USERNAME>

In both cases you will see the command prompt starting with `(ENV3)`.

**Validate Python and Pip Version in venv**

Check if you have the right version of python and pip installed with

.. code-block:: bash

   python --version
   pip --version

Now you are ready to install cloudmesh.

