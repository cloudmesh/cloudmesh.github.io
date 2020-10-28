multipass
=========

.. parsed-literal::

  Usage:
        multipass deploy [--dryrun]
        multipass list [--output=OUTPUT] [--dryrun]
        multipass images [--output=OUTPUT] [--dryrun]
        multipass create NAMES [--image=IMAGE]
                               [--size=SIZE]
                               [--mem=MEMORY]
                               [--cpus=CPUS]
                               [--cloud-init=FILE]
                               [--dryrun]
        multipass delete NAMES [--output=OUTPUT][--dryrun]
        multipass destroy NAMES [--output=OUTPUT][--dryrun]
        multipass shell NAMES [--dryrun]
        multipass run COMMAND NAMES [--output=OUTPUT] [--dryrun]
        multipass info NAMES [--output=OUTPUT] [--dryrun]
        multipass suspend NAMES [--output=OUTPUT] [--dryrun]
        multipass resume NAMES [--output=OUTPUT] [--dryrun]
        multipass start NAMES [--output=OUTPUT] [--dryrun]
        multipass stop NAMES [--output=OUTPUT] [--dryrun]
        multipass reboot NAMES [--output=OUTPUT] [--dryrun]
        multipass mount SOURCE DESTINATION [--dryrun]
        multipass umount SOURCE [--dryrun]
        multipass transfer SOURCE DESTINATION [--dryrun]
        multipass set key=VALUE [--dryrun]
        multipass get [key] [--dryrun]
        multipass deploy [--dryrun]
        multipass rename NAMES [--dryrun]
        multipass version

  Interface to multipass

  Options:
       --output=OUTPUT    the output format [default: table]. Other
                          values are yaml, csv and json.

       --image=IMAGE      the image name to be used to create a VM.

       --cpus=CPUS        Number of CPUs to allocate.
                          Minimum: 1, default: 1.

       --size=SIZE        Disk space to allocate. Positive integers,
                          in bytes, or with K, M, G suffix.
                          Minimum: 512M, default: 5G.

       --mem=MEMORY       Amount of memory to allocate. Positive
                          integers, in bytes, or with K, M, G suffix.
                          Minimum: 128M, default: 1G.

       --cloud-init=FILE  Path to a user-data cloud-init configuration

  Arguments:
      NAMES   the names of the virtual machine

  Description:

      The NAMES can be a parameterized hostname such as

        red[0-1,5] = red0,red1,red5

  Commands:

    First you can see the supported multipass images with

        cms multipass images

    Create and launch a new vm using

        cms multipass create NAMES

        Optionally you can provide image name, size, memory,
        number of cpus to create an instance.

    Start one or multiple multipass vms with

        cms multipass start NAMES

    Stop one or multiple vms with

        cms multipass stop NAMES

    Gets all multipass internal key values with

      cms multipass get

    Gets a specific internal key.

      cms multipass get KEY

      Known keys

          client.gui.autostart
          client.primary-name
          local.driver

          are there more?

    Reboot (stop and then start) vms with

        cms multipass reboot NAMES

    Delete one of multiple vms without purging with

        cms multipass delete NAMES

    Destory multipass vms (delete and purge) with

        cms multipass destroy NAMES

        Caution: Once destroyed everything in vm will be deleted
                 and cannot be recovered.

    WHEN YOU IMPLEMENT A FUNCTION INCLUDE MINIMAL
      DOCUMENTATION HERE
