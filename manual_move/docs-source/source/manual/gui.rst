gui
===

.. parsed-literal::

  Usage:
        gui activate
        gui profile
        gui mongo [user]
        gui cloud CLOUD [--show]
        gui edit KEY [--show]
        gui quick


  This command allows configuration of cloudmesh with a GUI

  Options:
      -f      specify the file
      --show  shows also the password

  Description:
        gui activate

          activates clouds by selecting them

        gui profile

          lets you fill out the profile

        gui mongo [user]

          lets you fill out the mongo information

        gui cloud CLOUD [--show]

          lets you fill out the specific cloud

        gui edit KEY [--show]

          lets you fill out any data identified by the Key in the yaml
          file in dot notation

        gui quicke

          lets you fill out a combination that is good enough to get
          you started in class (this is experiemental)
