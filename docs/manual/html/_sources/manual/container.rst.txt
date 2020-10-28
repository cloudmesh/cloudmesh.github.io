container
=========

.. parsed-literal::

  Usage:
      container [--os=OS]
                [--command=COMMAND]
                [--shell=SHELL]
                [--interactive=INTERACTIVE]
                [--window=WINDOW]

  Starts a docker container in interactive mode in a new container
  and executes the command in it.

  Arguments:
      --command=COMMAND   the command
      --os=OS        the os      [default: cloudmesh/book:latest]
      --shell=SHELL              [default: /bin/bash]
      --window=WINDOW            [default: True]
      --interactive=INTERACTIVE  [default: True]

  Options:
      -f      specify the file


  Description:
      container --os="cloudmesh/book:1.7" --command=ls
