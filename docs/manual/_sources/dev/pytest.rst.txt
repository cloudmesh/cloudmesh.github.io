Pytest
======

Pytest is a utility to unit test python code. We use pytest and not
``__main__`` to test all functionality so they can me automatically run and
reports can be generated. A project that does not have a sufficient
number of tests to make sure the module works can not be accepted.

Installation
------------

The pytest module can be installed with the help of pip utility:

.. code:: bash

    $ pip install pytest

This will install the pytest module in the current Python distribution.
All tests are included in the folder ``tests``. For example for the
cloudmesh-cloud module they are in

-  https://github.com/cloudmesh/cloudmesh-cloud/tree/master/tests

If the order of the tests is important make sure the tests are specified in
alphabetical order while introducing a numbering such as

::

    +cm
      + cloudmesh
      + tests
        - test_01_topic1.py
        - test_02_topic2.py
        - test_03_topic2.py


Cloudmesh Debugging Information
-------------------------------

To switch on debugging information for the tests you can do this with

.. code:: bash

    cms set trace=True
    cms set debug=True
    cms set verbose=10

After you are done testing, you may want to set them back to

.. code:: bash

    cms set trace=True
    cms set debug=True
    cms set verbose=10

You can also set them within a test with the command

.. code:: python

    from cloudmesh.common3.Benchmark import Benchmark

    Benchmark.debug()


Test Specification and Execution
--------------------------------

A simple example for a test is

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/tests/test_key.py

Note that all test python programs have specific function names of the
form

``def test_topic (self)``

Through the class decorator they are executed in order

A test may also have a method ``def setup(self)`` whcih is run prior to each
 other method.

A test method includes one or multiple asserts that check if a particular test
succeeds and reports this to pytest to expose the information if a tess
succeeds or fails, when running it

To have better visual separation of tests with the `--capture=no` option, all
pytest functions in cloudmesh start with a ``HEADING()``, which will print a
banner with the function name. Invocation is simply done with the comment
lines you see on top that you will include. In our case the test is called
`test_key.py` so we include on the top::

    ###############################################################
    # pytest -v --capture=no tests/test_key.py
    # pytest -v  tests/test_key.py
    # pytest -v --capture=no -v tests/test_key.py:Test_key.<METHODNAME>
    ###############################################################

Make sure that you place this comment in your tests. to remind the
developers how to execute your test from the main directory. If you need
dpecial instructions, please add them here.


The following example is our simple pytest for key. THe file is stored at
``tests/test_key.py``

First, we import the needed classes and methods we like to test. We
define a class, and than we define the methods. such as the setup and
the actual tests.

your run it with

.. code:: bash

    $ pytest -v --capture=no tests/test_key.py

.. code:: python

    ###############################################################
    # pytest -v --capture=no tests/test_key.py
    # pytest -v  tests/test_key.py
    # pytest -v --capture=no -v --nocapture tests/test_key.py:Test_key.<METHIDNAME>
    ###############################################################
    from pprint import pprint
    from cloudmesh.common.Printer import Printer
    from cloudmesh.common.util import HEADING, banner
    from cloudmesh.management.configuration.SSHkey import SSHkey
    from cloudmesh.management.configuration.config import Config
    from cloudmesh.common.StopWatch import StopWatch

    @pytest.mark.incremental
    class TestKey:

        def setup(self):
            self.sshkey = SSHkey()


        def test_find_key(self):
            HEADING()
            StopWatch.stop("key")
            pprint(self.sshkey)
            print(self.sshkey)
            print(type(self.sshkey))
            pprint(self.sshkey.__dict__)

            assert self.sshkey.__dict__  is not None


        def test__key_from_git(self):
            HEADING()
            config = Config()
            username = config["cloudmesh.profile.github"]
            print ("Username:", username)
            StopWatch.start("get from git")
            keys = self.sshkey.get_from_git(username)
            StopWatch.stop("get from git")
            pprint (keys)
            print(Printer.flatwrite(keys,
                                sort_keys=("name"),
                                order=["name", "fingerprint"],
                                header=["Name", "Fingerprint"])
                  )

            assert len(keys) > 0
            
        
        def test_results(self):
            HEADING()
            banner(f"Benchmark results for Keys")
            StopWatch.benchmark()

The output with ``pytest tests/test_key.py`` does not provide any
detail, but just reports if tests fail or succeed.

::

    ----------------------------------------------------------------------
    Ran 2 tests in 0.457s

    OK

The output with ``pytest -v tests/test_key.py`` results in

::

    tests.test_key.TestName.test_01_key ... ok
    tests.test_key.TestName.test_02_git ... ok

    ----------------------------------------------------------------------
    Ran 2 tests in 1.072s

    OK

During development phase you want to use

``pytest -v --capture=no tests/test_key.py``

which prints all print statements
