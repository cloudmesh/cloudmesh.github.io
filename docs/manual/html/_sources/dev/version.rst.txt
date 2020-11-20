Version Management
==================

.. warning:: Version management is only done by Gregor von Laszewski.

To create a development version we say

.. code:: bash

    $ make build

To increase the patch number, say

.. code:: bash

    $ make patch

To increase the minor number

.. code:: bash

    $ make minor

The major number will stay to 4, so this is not changed

To create a release say

.. code:: bash

    $ make release
