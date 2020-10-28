git
===

.. parsed-literal::

  Usage:
        git create issue --repo=REPO --file=FILE [--title=TITLE] [--org=ORG]
        git create repository FIRSTNAME LASTNAME GITHUBID [--org=ORG]
        git create repository --file=FILE [--org=ORG]
        git list [MATCH] [--org=ORG]


  This command does some useful things.

  Arguments:
      FILE   a file name
      ORG    [default: cloudmesh-community]
      MATCH  is a string that must occur in the repo name or description
      --file=FILE   specify the file
      --repo=REPO   the repository

  Options:

  Description:

        The organization is set by default to
        cloudmesh-community

        git list

            lists the repos of the organization

        git create issue --repo=REPO FILE
           Create an issue in the given repos.
           Note that the repos is a string defined as
           cloudmesh.Parameter, E.g. fa19-516-[100-103,105]
           effects the repos ending with 100, 101, 102,
           103, and 105

           The bundle is defined in cloudmesh-installer

        git create repo NAME FIRSTNAME LASTNAME GITHUBID
            creates the repo

        git create repo --file=repos.csv
            creates repos from a file in csv format
            the format in th csv file is

            reponame,lastname,firstname,githubid

  Examples:

       cms git list "Park"

          Lists all repos with the name Park in it or its description

       cms git list "fa19-523"

            Lists all repos with the string  fa19-523 in its name
