emr
===

::

    Usage:
	emr list clusters [--status=STATUS...] [--format=FORMAT]
	emr list instances CLUSTERID [--status=STATUS...] [--type=TYPE...] [--format=FORMAT]
	emr list steps CLUSTERID [--state=STATE...] [--format=FORMAT]
	emr describe CLUSTERID [--format=FORMAT]
	emr start NAME [--master=MASTER] [--node=NODE] [--count=COUNT]
	emr stop CLUSTERID
	emr upload FILE BUCKET BUCKETNAME
	emr copy CLUSTERID BUCKET BUCKETNAME
	emr run CLUSTERID BUCKET BUCKETNAME


    This command is used to interface with Amazon Web Services
    Elastic Map Reduce (EMR) service to run Apache Spark jobs.
    It can start, list, and stop clusters and submit jobs to them.

    Arguments:
	CLUSTERID               The AWS Cluster ID.
	NAME                    The name of the cluster.
	FILE                    The local file to upload.
	BUCKET                  The name of the S3 bucket to use.
	BUCKETNAME              The name to file in the Bucket to use.

    Options:
	--status=STATUS         The status to search for.  [default: all]
	--type=TYPE             The type of instance to search for.  [default: all]
	--format=FORMAT         How to format the output.  [default: table]
	--master=MASTER         The type of server to use for the master node. [default: m3.xlarge]
	--node=NODE             The type of server to use for the worker nodes. [default: m3.xlarge]
	--count=COUNT           The number of servers to use [default: 3]
	--state=STATE           The state of the job step to filter for.

    Description:
	emr list clusters [--status=STATUS] [--format=FORMAT]

	    Lists all clusters viewable to the credentials with a
	    given status [default: all]. Valid statuses are: start,
	    boot, run, wait, terminating, shutdown, and error.

	emr list instances [--status=STATUS...] [--format=FORMAT]

	    Lists all instances viewable to the credentials with a given
	    status [default: all]. Valid statuses are: start, provision,
	    boot, run, down. Valid types are: master, core, and task.

	emr list steps CLUSTERID [--state=STATE...]

	    Lists all steps being performed by a cluster. Valid states are
	    pending, canceling, running, completed cancelled, failed, and
	    interrupted

	emr describe CLUSTERID

	    Describes a cluster. Lists its status, region, type, etc.

	emr stop CLUSTERID

	    Stops a cluster. Once a shutdown is initiated, it cannot be
	    undone.

	emr start NAME [--master=MASTER] [--node=NODE] [--count=COUNT]

	    Starts a cluster with a given name, number of servers, and
	    server type. Bootstraps with Hadoop and Spark.

	emr copy BUCKET BUCKETNAME

	    Copy a file from S3 to the cluster's master node.

	emr run CLUSTERID BUCKET BUCKETNAME

	    Submit a spark application stored in an S3 bucket to the spark
	    cluster.
