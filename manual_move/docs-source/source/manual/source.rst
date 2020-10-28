source
======

.. parsed-literal::

  Usage:
      source list
      source install [--protocol=PROTOCOL]


  This command does some useful things.

  Arguments:
      KEY   a file name

  Options:
      -f      specify the file
      --protocol=PROTOCOL   [default: ssh]
      --output=OUTPUT       [default: table]

  Description:

     you cen specify in your yaml file the location of where you
     manage your source code.

     cloudmesh:
        source:
          common: ~/Desktop/github/cloudmesh
          cmd5: ~/Desktop/github/cloudmesh
          openapi: ~/Desktop/github/cloudmesh
          sys: ~/Desktop/github/cloudmesh
          cm: ~/Desktop/github/cloudmesh-community


    Once you have this included and cms cm is installed, you can than for
    example do an update from source with

        cms source install

    This has the advantage that all cms directories pull the new code
    from git. It assumes that you have installed the source
    previously with

        pip install -e .

    in each of the directories
