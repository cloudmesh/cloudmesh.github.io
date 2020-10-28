How to install python on Windows
=================================

The easiest installation of Python for cloudmesh is to use the installation from
https://www.python.org/downloads. Please, visit the page and follow the
instructions. After this install you have `python3` available from the
command line.

Please use the 64 bit version. By default whne you are not
careful python.org will point you to the 32 bit version. So please locate it.



After install make sure you have the right version of python with::

    python --version
    python -c 'import sys;print("%x" % sys.maxsize, sys.maxsize > 2**32)'`

