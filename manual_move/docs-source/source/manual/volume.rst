volume
======

.. parsed-literal::

  Usage:
    volume register which
    volume register [NAME] [--cloud=CLOUD] [ARGUMENTS...]
    volume list [NAMES]
                [--vm=VM]
                [--region=REGION]
                [--cloud=CLOUD]
                [--refresh]
                [--dryrun]
                [--output=FORMAT]
    volume create [NAME]
              [--size=SIZE]
              [--volume_type=TYPE]
              [--description=DESCRIPTION]
              [--dryrun]
              [ARGUMENTS...]
    volume status [NAMES]
              [--cloud=CLOUD]
    volume attach [NAMES] [--vm=VM]
    volume detach [NAMES]
    volume delete NAMES
    volume migrate NAME FROM_VM TO_VM
    volume sync FROM_VOLUME TO_VOLUME

  This command manages volumes accross different clouds

  Arguments:
      NAME   the name of the volume
      vm     the name of the vm

  Options:
      --vm=VMNAME        The name of the virtual machine
      --region=REGION    The name of the region
      --cloud=CLOUD      The name of the cloud
      --refresh          If refresh the information is taken from the cloud
      --volume_type=TYPE  The type of the volume
      --output=FORMAT    Output format [default: table]

  Description:

    volume register which
        TODO: describe

    volume register [NAME] [--cloud=CLOUD] [ARGUMENTS...]
        TODO: describe

    volume list [NAMES]
                [--vm=VM]
                [--region=REGION]
                [--cloud=CLOUD]
                [--refresh]
                [--dryrun]
                [--output=FORMAT]
        List all the volumes for certain vm, region, or cloud.

    volume create [NAME]
              [--size=SIZE]
              [--volume_type=TYPE]
              [--description=DESCRIPTION]
              [--dryrun]
              [ARGUMENTS...]
        Creates a volume

    volume status [NAMES]
              [--cloud=CLOUD]
    volume attach [NAMES] [--vm=VM]
        Attatch volume to a vm

    volume detach [NAMES]
        Dettatch volume from a vm

    volume delete NAMES
        Delete the named volumes

    volume migrate NAME FROM_VM TO_VM
         TODO: not yet implemented
         Migrate volume from one vm to another vm between different
         regions, services or providers. `

    volume sync FROM_VOLUME TO_VOLUME
        TODO: not yet implemented
        Volume sync alows for data to shared bewteen two volumes.
