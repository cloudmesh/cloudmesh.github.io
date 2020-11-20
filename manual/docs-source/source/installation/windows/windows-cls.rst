How to install cls on Windows
==============================

Some Python libraries may need to be compiled. In order for you to complete
your Python instalation you want to install th *VC C++ command line Build Tools*.
This is mostly needed for cryptography libraries.
You can find them at:

  * https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019

Once you run the installer
you need to check on the choices as shown in the next image.

  .. figure:: images/VSprintscreen.PNG
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: select the commandline (CLI) build tools

You will also have to add the following path to the PATH variable::

     C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\

Make sure you adapt your path based on te current version of this program
