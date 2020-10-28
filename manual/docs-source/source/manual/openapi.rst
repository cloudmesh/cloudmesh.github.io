
# ######################################################################
# Arguments
# ######################################################################
# {'--kind': 'rst', '--noheader': False, 'COMMAND': 'openapi'}
# ######################################################################

openapi
=======

::

  Usage:
        openapi merge [SERVICES...] [--dir=DIR] [--verbose]
        openapi list [--dir=DIR]
        openapi description [SERVICES...] [--dir=DIR]
        openapi md FILE [--indent=INDENT]
        openapi codegen [SERVICES...] [--srcdir=SRCDIR]
                        [--destdir=DESTDIR]
        openapi server start YAML [--directory=DIRECTORY] [--port=PORT] [--server=SERVER] [--verbose]
        openapi server stop YAML

  Arguments:
      DIR   The directory of the specifications
      FILE  The specification
      SRCDIR   The directory of the specifications
      DESTDIR  The directory where the generated code should be put

  Options:
      --verbose              specifies to run in debug mode [default: False]
      --port=PORT            the port for the server [default: 8080]
      --directory=DIRECTORY  the directory in which the server is run [default: ./]
      --server=SERVER        teh server [default: flask]
  Description:
    This command does some useful things.

Timer: 0.0148s (man --kind=rst openapi)
