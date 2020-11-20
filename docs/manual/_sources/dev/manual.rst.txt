Documentation Management
------------------------

To increase readability of the documentation we ask you to try to use 80
character line limits if possible. You can install the plugin
`Wrap to Column`

* https://plugins.jetbrains.com/plugin/7234-wrap-to-column

This is important for better editing experience.  With the functions `Edit-Wrap
Line to column` or `Edit-Wrap Line to paragraph`` that are assigned to keyboard
shortcuts such as ``CONTROL-SHIFT-COMMAND-W`` or ``CONTROL-SHIFT-COMMAND-P``

Alternatively we recommend to use emacs fro line wrapping as it provides with
``Esc-q`` a build in tool.


All of the documentations are in the ``cloudmesh-manual`` repository which is
automatically cloned when installing the cloudmesh using
``cloudmesh-installer`` The documentation source files are located in
``docs-source`` folder inside the ``cloudmesh-manual`` repository.

It's very important to build the documentation locally and test the
modifications before pushing them to the remote. To build the documentation
locally you first, make sure that the proper virtual environment is activated,
then make sure that you have a ``cloudmesh.yaml`` file  in the path
``~/.cloudmesh/cloudmehs.yaml``. Please follow the cloudmesh install
instructions for developer. Then you need to install the requirements and
make the documentation:

.. code:: bash

    cd cloudmesh-manual
    pip install -r requirements.txt
    make clean  # cleans up the documentation
    make manual # creates the manual pages
    make view   # views the documentation

In case you do not develop new commands with manual page changes, you
can in subsecuetnt calls say ``make doc``. Please note that `rst` and
`md` files are allowed as documentation format.
 
