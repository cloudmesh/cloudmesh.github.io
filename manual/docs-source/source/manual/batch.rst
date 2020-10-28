batch
=====

.. parsed-literal::

  Usage:
    batch job create
        --name=NAME
        --cluster=CLUSTER
        --script=SCRIPT
        --executable=EXECUTABLE
        --destination=DESTINATION
        --source=SOURCE
        [--companion-file=COMPANION_FILE]
        [--outfile-name=OUTPUT_FILE_NAME]
        [--suffix=SUFFIX]
        [--overwrite]
    batch job run [--name=NAMES] [--output=OUTPUT]
    batch job fetch [--name=NAMES]
    batch job remove [--name=NAMES]
    batch job clean [--name=NAMES]
    batch job set [--name=NAMES] PARAMETER=VALUE
    batch job list [--name=NAMES] [--depth=DEPTH]
    batch connection_test --job=JOB
    batch cluster list [--cluster=CLUSTERS] [--depth=DEPTH]
    batch cluster remove [--cluster=CLUSTERS]
    batch cluster set [--cluster=CLUSTERS] PARAMETER=VALUE

  Arguments:
      FILE   a file name
      INPUT_TYPE  tbd

  Options:
      -f      specify the file
      --depth=DEPTH   [default: 1]
      --output=OUTPUT    [default: table]

  Description:

    This command allows to submit batch jobs to queuing systems hosted
    in an HBC center as a service directly form your commandline.

    We assume that a number of experiments are conducted with possibly
    running the script multiple times. Each experiment will save the
    batch script in its own folder.

    The output of the script can be saved in a destination folder. A virtual
    directory is used to coordinate all saved files.

    The files can be located due to the use of the virtual directory on
    multiple different data or file services

    Authentication to the Batch systems is done viw the underlaying HPC
    center authentication. We assume that the user has an account to
    submit on these systems.

    (SSH, 2 factor, XSEDE-account) TBD.

  Experiments:

    experiments are jobs that can be run multiple times and create input
    and output file sin them

    cloudmesh:
     experiment:
       job:
         name: {cloudmesh.profile.user.name}-01
         directory: ~/experiment/{experiment.job.name}
         output:  {cloudmesh.experiment.job.name}/output
         input:  ~/experiment/{experiment.job.name}/input
         script: script.sh
         source ,,,
         destination: {cloudmesh.experiment.job.directory}

    - queue associates with server (cloud)
    - job could be run on queue and is associated with one or multiple
    servers
    - experiment is same as job, but gives some facility to run it
    multiple times

    I do not know what companion file is

  Examples:

     batch job run [--name=NAMES] [--output=OUTPUT]

        runs jobs with the given names

     LOTS OF DOCUMENTATION MISSING HERE

        [--companion-file=COMPANION_FILE]
        [--outfile-name=OUTPUT_FILE_NAME]
        [--suffix=SUFFIX] [--overwrite]
