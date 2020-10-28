host
====

.. parsed-literal::

  Usage:
      host scp NAMES SOURCE DESTINATION [--dryrun]
      host ssh NAMES COMMAND [--dryrun] [--output=FORMAT]
      host config NAMES [IPS] [--user=USER] [--key=PUBLIC]
      host check NAMES [--user=USER] [--key=PUBLIC]
      host key create NAMES [--user=USER] [--dryrun] [--output=FORMAT]
      host key list NAMES [--output=FORMAT]
      host key gather NAMES [--authorized_keys] [FILE]
      host key scatter NAMES FILE

  This command does some useful things.

  Arguments:
      FILE   a file name

  Options:
      --dryrun   shows what would be done but does not execute
      --output=FORMAT  the format of the output

  Description:

      host scp NAMES SOURCE DESTINATION

        TBD

      host ssh NAMES COMMAND

        runs the command on all specified hosts
        Example:
             ssh red[01-10] "uname -a"

      host key create NAMES
        create a ~/.ssh/id_rsa and id_rsa.pub on all hosts specified
        Example:
            ssh key create "red[01-10]"

      host key list NAMES

        list all id_rsa.pub keys from all hosts specifed
         Example:
             ssh key list red[01-10]

      host key gather HOSTS FILE

        gathers all keys from file FILE including the one from localhost.

            ssh key gather "red[01-10]" keys.txt

      host key scatter HOSTS FILE

        copies all keys from file FILE to authorized_keys on all hosts,
        but also makes sure that the users ~/.ssh/id_rsa.pub key is in
        the file.

        1) adds ~/.id_rsa.pub to the FILE only if its not already in it
        2) removes all duplicated keys

        Example:
            ssh key scatter "red[01-10]"

      host key scp NAMES FILE

        copies all keys from file FILE to authorized_keys on all hosts
        but also makes sure that the users ~/.ssh/id_rsa.pub key is in
        the file and removes duplicates, e.g. it calls fix before upload

        Example:
            ssh key list red[01-10] > pubkeys.txt
            ssh key scp red[01-10] pubkeys.txt

      host config NAMES IPS [--user=USER] [--key=PUBLIC]

        generates an ssh config file tempalte that can be added to your
        .ssh/config file

        Example:
            cms host config "red,red[01-03]" "198.168.1.[1-4]" --user=pi

      host check NAMES [--user=USER] [--key=PUBLIC]

        This command is used to test if you can login to the specified
        hosts. It executes the hostname command and compares it.
        It provides a table  with a sucess column

        cms host check "red,red[01-03]"

            +-------+---------+--------+
            | host  | success | stdout |
            +-------+---------+--------+
            | red   | True    | red    |
            | red01 | True    | red01  |
            | red02 | True    | red02  |
            | red03 | True    | red03  |
            +-------+---------+--------+
