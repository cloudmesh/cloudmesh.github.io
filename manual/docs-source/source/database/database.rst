Cloudmesh Database
==================

Cloudmesh has a database in which a local copy of information about
objects that are stored in the cloud is maintained. The objects contain
all information of the cloud that can be retrieved with the raw provider
but are enhanced with a cloudmesh attribute dict. Potential security
related attributes, will however be removed from it so they are not
stored in the database.

This dict looks like

::

    "cm": {
       "kind": the kind of the provider
       "cloud": the cloud or service name, will be renamed to service in future)
       "name": a unique name of the object
    }

We list in the next section examples of such data objects

Virtual Machines
----------------

Openstack
~~~~~~~~~

The compute provider kind is ``openstack``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/virtualbox/Provider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/vm/Provider.py

Flavor
^^^^^^

::

    {
        "_id" : ObjectId("5ca798a7dc64f18b19e644e1"),
        "id" : "1",
        "name" : "m1.tiny",
        "ram" : 512,
        "disk" : 1,
        "bandwidth" : null,
        "price" : 0.0,
        "extra" : {},
        "vcpus" : 1,
        "ephemeral_disk" : 0,
        "swap" : "",
        "cm" : {
            "kind" : "flavor",
            "driver" : "openstack",
            "cloud" : "chameleon",
            "created" : "2019-04-05 18:04:23.621043",
            "name" : "m1.tiny",
            "collection" : "chameleon-flavor",
            "modified" : "2019-04-06 06:50:23.894035"
        },
        "updated" : "2019-04-06 06:50:23.867695"
    }

Image
^^^^^

::

    {
        "_id" : ObjectId("5ca798abdc64f18b19e644e9"),
        "id" : "4c8e6dac-97f0-4224-b7a2-0daef96b5c9f",
        "name" : "CC-Ubuntu16.04",
        "extra" : {
            "visibility" : null,
            "updated" : "2019-03-25T21:21:06Z",
            "created" : "2019-03-25T21:20:51Z",
            "status" : "ACTIVE",
            "progress" : 100,
            "metadata" : {
                "build-repo-commit" : "4ba0beb418de52f0d3bf93a94392b662d653c073",
                "build-variant" : "base",
                "build-os-base-image-revision" : "20190325",
                "build-os" : "ubuntu-xenial",
                "build-tag" : "jenkins-cc-ubuntu16.04-builder-34",
                "build-repo" : "https://github.com/ChameleonCloud/CC-Ubuntu16.04"
            },
            "os_type" : null,
            "serverId" : null,
            "minDisk" : 0,
            "minRam" : 0
        },
        "cm" : {
            "kind" : "image",
            "driver" : "openstack",
            "cloud" : "chameleon",
            "created" : "2019-04-05 18:04:27.417958",
            "updated" : "2019-03-25T21:21:06Z",
            "name" : "CC-Ubuntu16.04",
            "collection" : "chameleon-image",
            "modified" : "2019-04-06 06:50:33.747656"
        }
    }

VM
^^

::

    {
        "_id" : ObjectId("5ca798acdc64f18b19e6454e"),
        "id" : "f531d2df-c472-4b32-8239-0e3969d33ebb",
        "name" : "exp-grp-gregor-vm-1",
        "state" : "running",
        "public_ips" : [],
        "private_ips" : [
            "192.168.0.249"
        ],
        "size" : null,
        "created_at" : ISODate("2019-04-01T11:05:56.000-04:00"),
        "image" : null,
        "extra" : {
            "addresses" : {
                "CH-819337-net" : [
                    {
                        "OS-EXT-IPS-MAC:mac_addr" : "fa:16:3e:9d:ca:c2",
                        "version" : 4,
                        "addr" : "192.168.0.249",
                        "OS-EXT-IPS:type" : "fixed"
                    }
                ]
            },
            "hostId" : "64472a496451a2d599c215a8e86275191c9e3fb9d53790de35bbb6dc",
            "access_ip" : "",
            "access_ipv6" : "",
            "tenantId" : "CH-819337",
            "userId" : "tg455498",
            "imageId" : "4c8e6dac-97f0-4224-b7a2-0daef96b5c9f",
            "flavorId" : "3",
            "uri" : "http://openstack.tacc.chameleoncloud.org:8774/v2/CH-819337/servers/f531d2df-c472-4b32-8239-0e3969d33ebb",
            "service_name" : "nova",
            "metadata" : {},
            "password" : null,
            "created" : "2019-04-01T15:05:56Z",
            "updated" : "2019-04-01T15:06:06Z",
            "key_name" : "gregor",
            "disk_config" : "MANUAL",
            "config_drive" : "",
            "availability_zone" : "nova",
            "volumes_attached" : [],
            "task_state" : null,
            "vm_state" : "active",
            "power_state" : 1,
            "progress" : 0,
            "fault" : null
        },
        "cm" : {
            "kind" : "node",
            "driver" : "openstack",
            "cloud" : "chameleon",
            "updated" : "2019-04-06 06:50:35.592158",
            "name" : "exp-grp-gregor-vm-1",
            "created" : "2019-04-05 18:04:28.376784",
            "collection" : "chameleon-node",
            "modified" : "2019-04-06 06:50:35.596479"
        }
    }

Azure AzProvider
----------------

The compute provider kind is ``azure``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/azure/AzProvider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/vm/Provider.py


Flavor
~~~~~~

.. todo:: Azure - A detailed dict of the flavor is missing

Image
~~~~~

.. todo:: Azure - A detailed dict of the image is missing

VM
~~

::

    {
        "_id" : ObjectId("5cbe0513b6ac5a154ef64a26"),
        "additionalCapabilities" : null,
        "availabilitySet" : null,
        "diagnosticsProfile" : null,
        "hardwareProfile" : {
            "vmSize" : "Standard_DS1_v2"
        },
        "id" : null,
        "identity" : null,
        "instanceView" : null,
        "licenseType" : null,
        "location" : "eastus",
        "name" : "testvm1",
        "networkProfile" : {
            "networkInterfaces" : [ 
                {
                    "id" : null,
                    "primary" : null,
                    "resourceGroup" : "test"
                }
            ]
        },
        "osProfile" : {
            "adminPassword" : null,
            "adminUsername" : "ubuntu",
            "allowExtensionOperations" : true,
            "computerName" : "testvm1",
            "customData" : null,
            "linuxConfiguration" : {
                "disablePasswordAuthentication" : true,
                "provisionVmAgent" : true,
                "ssh" : {
                    "publicKeys" : [ 
                        {
                            "keyData" : "ssh-rsa ...."
                            "path" : "/home/ubuntu/.ssh/authorized_keys"
                        }
                    ]
                }
            },
            "requireGuestProvisionSignal" : true,
            "secrets" : [],
            "windowsConfiguration" : null
        },
        "plan" : null,
        "provisioningState" : "Succeeded",
        "resourceGroup" : "test",
        "resources" : null,
        "storageProfile" : {
            "dataDisks" : [],
            "imageReference" : {
                "id" : null,
                "offer" : "UbuntuServer",
                "publisher" : "Canonical",
                "sku" : "18.04-LTS",
                "version" : "latest"
            },
            "osDisk" : {
                "caching" : "ReadWrite",
                "createOption" : "FromImage",
                "diffDiskSettings" : null,
                "diskSizeGb" : null,
                "encryptionSettings" : null,
                "image" : null,
                "managedDisk" : {
                    "id" : null,
                    "resourceGroup" : "test",
                    "storageAccountType" : null
                },
                "name" : "testvm1_OsDisk_1_a6a6a6a7639468d88e7b018385e225f",
                "osType" : "Linux",
                "vhd" : null,
                "writeAcceleratorEnabled" : null
            }
        },
        "tags" : {},
        "type" : "Microsoft.Compute/virtualMachines",
        "vmId" : "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa",
        "zones" : null,
        "cm" : {
            "kind" : "node",
            "driver" : "azure",
            "cloud" : "az",
            "name" : "testvm1",
            "collection" : "az-node",
            "created" : "2019-04-22 18:16:51.552324",
            "modified" : "2019-04-22 18:16:51.552324"
        }
    }

Azure MS Azure Library Provider
-------------------------------

This provider is written with the help of the Azure python libraries

.. todo:: Azure Python - A detailed dict of the Azure Python provider is missing


This provider should not be used, but you need to use the general
provider at


This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/vm/Provider.py


Flavor
~~~~~~

.. todo:: Azure Python - A detailed dict of the flavor is missing


Image
~~~~~

.. todo:: Azure Python - A detailed dict of the image is missing


VM
~~

.. todo:: Azure Python - A detailed dict of the vm is missing


AWS Libcloud Provider
---------------------

The compute provider kind is ``aws``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/aws/Provider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/vm/Provider.py

Flavor
~~~~~~

::

    {'bandwidth': None,
     'cm': {'cloud': 'aws',
            'created': '2019-04-25 11:01:21.939851',
            'driver': 'aws',
            'kind': 'flavor',
            'name': 't2.micro'},
     'disk': 0,
     'id': 't2.micro',
     'name': 't2.micro',
     'price': 0.012,
     'ram': 1024,
     'updated': '2019-04-25 11:01:21.939851'}

Image
~~~~~

::

    {'cm': {'cloud': 'aws',
             'created': '2019-04-25 11:10:31.912143',
             'driver': 'aws',
             'kind': 'image',
             'name': 'memsql-cloudformation_6.7.11-5d2517b77a_1.5.3_1.0.6 '
                     '20190208-212347',
             'updated': '2019-04-25 11:10:31.912155'},
      'id': 'ami-0496a382c868777a4',
      'name': 'memsql-cloudformation_6.7.11-5d2517b77a_1.5.3_1.0.6 '
              '20190208-212347'}

VM
~~

::

    {'cm': {'cloud': 'aws',
             'created': '2019-04-25 06:47:39+00:00',
             'driver': 'aws',
             'kind': 'node',
             'name': 't0',
             'updated': '2019-04-25 10:55:45.394053'},
      'created_at': datetime.datetime(2019, 4, 25, 6, 47, 39, tzinfo=<libcloud.utils.iso8601.Utc object at 0x1119225c0>),
      'id': 'i-032d5c07fcfaf5b8b',
      'image': None,
      'name': 't0',
      'private_ips': [],
      'public_ips': [],
      'size': None,
      'state': 'running'}

AWS Boto3 Provider
------------------

The compute provider kind is ``MISSING``. The Provider is located at

-  

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/compute/vm/Provider.py

Flavor
~~~~~~

.. todo:: AWS Boto - A detailed dict of the flavor is missing

Image
~~~~~

.. todo:: AWS Boto - A detailed dict of the image is missing

VM
~~

.. todo:: AWS Boto - A detailed dict of the flavor is missing

Storage
-------

Box
~~~

The storage provider kind is ``box``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/provider/box/Provider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/Provider.py

Directory
^^^^^^^^^

.. code:: bash

    {'_object_id': '71983743142',
        'cm': {
            'cloud': 'box', 
        'kind': 'storage', 
        'name': 'test01'
        },
        'etag': '0',
        'id': '71983743142',
        'name': 'test01',
        'sequence_id': '0',
        'type': 'folder'}

File
^^^^

.. code:: bash

    {'_object_id': '432543586295',
      'cm': {
          'cloud': 'box', 
          'kind': 'storage', 
          'name': 'test.txt'
      },
      'etag': '285',
      'id': '432543586295',
      'name': 'test.txt',
      'sequence_id': '285',
      'sha1': 'bca20547e94049e1ffea27223581c567022a5774',
      'type': 'file'}]

Azure Blob
~~~~~~~~~~

The storage provider kind is ``azureblob``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/provider/azureblob/Provider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/Provider.py

Directory
^^^^^^^^^

Note that directory in Azure Blob storage is a virtual folder. An empty
directory cannot be created and hence cloudmesh-storage creates a
default marker file ``dummy.txt`` to create the directory.

.. code:: bash

    {'cm': {'cloud': 'azureblob',
             'created': '2',
             'kind': 'storage',
             'name': 'dirtest/dummy.txt',
             'size': 1,
             'status': 'exists',
             'updated': '2'},
      'content': None,
      'deleted': False,
      'metadata': None,
      'name': 'dirtest/dummy.txt',
      'properties': {'append_blob_committed_block_count': None,
                     'blob_tier': None,
                     'blob_tier_change_time': None,
                     'blob_tier_inferred': False,
                     'blob_type': 'BlockBlob',
                     'content_length': 1,
                     'content_range': None,
                     'deleted_time': None,
                     'etag': '0x8D6CA68C2D61B73',
                     'page_blob_sequence_number': None,
                     'remaining_retention_days': None,
                     'server_encrypted': True},
      'snapshot': None}

File
^^^^

.. code:: bash

    {'cm': {'cloud': 'azureblob',
             'created': '2',
             'kind': 'storage',
             'name': 'a/a/a1.txt',
             'size': 19,
             'status': 'exists',
             'updated': '2'},
      'content': None,
      'deleted': False,
      'metadata': None,
      'name': 'a/a/a1.txt',
      'properties': {'append_blob_committed_block_count': None,
                     'blob_tier': None,
                     'blob_tier_change_time': None,
                     'blob_tier_inferred': False,
                     'blob_type': 'BlockBlob',
                     'content_length': 19,
                     'content_range': None,
                     'deleted_time': None,
                     'etag': '0x8D6CA57263B4AEA',
                     'page_blob_sequence_number': None,
                     'remaining_retention_days': None,
                     'server_encrypted': True},
      'snapshot': None}


AWSS3 Provider
~~~~~---------

.. todo:: explain the difference between AWSS3 and AWSS3object store provider

The storage provider kind is ``awss3``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/provider/awss3/Provider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/Provider.py

Directory
^^^^^^^^^

.. todo:: details of the AWSS3 provider directory is missing

File
^^^^

.. todo:: details of the AWSS3 provider file is missing

AWSS3 Objectstore Provider
~~~~~~~~~~~~~~~~~~~~~~~~~~

It is unclear what the difference to AWSS3 the one from cloudmesh-cloud
is Please explain. If its the same, let us know and we should merge

The storage provider kind is ``objstorage``. The Provider is located at

-  link is missing

.. todo:: details of the AWSS3 provider directory is missing

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/Provider.py

Directory
^^^^^^^^^

.. todo:: details of the AWSS3 objectstore provider directory is missing

File
^^^^

.. todo:: details of the AWSS3 objectstore provider file is missing

Google Drive
~~~~~~~~~~~~

The storage provider kind is ``gdrive``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/provider/gdrive/Provider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/Provider.py

Directory
^^^^^^^^^

.. todo:: details of the google storage provider directory is missing

File
^^^^

.. todo:: details of the google storage provider file is missing



Local
~~~~~

This has not been tested yet, so be careful as it could remove local dir
trees. we may need ta add an option --force for this provider and always
ask if we want to delete the files while showing them first. This could
even be a reason to introduce it in all providers.

The storage provider kind is ``local``. The Provider is located at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/provider/local/Provider.py

This provider should not be used, but you need to use the general
provider at

-  https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/Provider.py

Directory
^^^^^^^^^

File
^^^^

Workflow
--------

::

    /* 2 */
    {
        "_id" : ObjectId("5cbc414e20b39a69d014efec"),
        "name" : "b",
        "dependencies" : [
            "c"
        ],
        "workflow" : "workflow",
        "cm" : {
            "kind" : "flow",
            "cloud" : "workflow",
            "name" : "b",
            "collection" : "workflow-flow",
            "created" : "2019-04-21 10:09:18.887115",
            "modified" : "2019-04-21 10:09:18.887115"
        },
        "kind" : "flow",
        "cloud" : "workflow"
    }

EMR
---

Cluster Listing
~~~~~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae2f2176cd490cac627e04"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr cluster list",
            "name" : "emr",
            "collection" : "aws-emr cluster list",
            "created" : "2019-04-10 18:00:01.850862",
            "modified" : "2019-04-10 18:00:55.341485"
        },
        "data" : [
            {
                "Id" : "j-XXXXXXXXXXXXX",
                "Name" : "NAME",
                "Status" : {
                    "State" : "TERMINATED",
                    "StateChangeReason" : {
                        "Code" : "USER_REQUEST",
                        "Message" : "Terminated by user request"
                    },
                    "Timeline" : {
                        "CreationDateTime" : ISODate("2019-04-04T01:38:26.595Z"),
                        "EndDateTime" : ISODate("2019-04-04T01:43:53.907Z")
                    }
                },
                "NormalizedInstanceHours" : 0
            },
          ...
        ]
    }

Instance Listing
~~~~~~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae36b976cd490de715a25a"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr instance list",
            "name" : "j-XXXXXXXXXXXXX",
            "collection" : "aws-emr instance list",
            "created" : "2019-04-10 18:32:25.886579",
            "modified" : "2019-04-10 18:32:39.244152"
        },
        "data" : [
            {
                "Id" : "ci-XXXXXXXXXXXXX",
                "Ec2InstanceId" : "i-XXXXXXXXXXXXX",
                "PublicDnsName" : "ec2-54-193-70-173.us-west-1.compute.amazonaws.com",
                "PublicIpAddress" : "54.193.70.173",
                "PrivateDnsName" : "ip-172-31-10-13.us-west-1.compute.internal",
                "PrivateIpAddress" : "172.31.10.13",
                "Status" : {
                    "State" : "TERMINATED",
                    "StateChangeReason" : {
                        "Code" : "INSTANCE_FAILURE",
                        "Message" : "Instance was terminated."
                    },
                    "Timeline" : {
                        "CreationDateTime" : ISODate("2019-04-04T01:39:20.733Z"),
                        "ReadyDateTime" : ISODate("2019-04-04T01:42:11.677Z"),
                        "EndDateTime" : ISODate("2019-04-04T01:43:53.810Z")
                    }
                },
                "InstanceGroupId" : "ig-XXXXXXXXXXXXX",
                "Market" : "ON_DEMAND",
                "InstanceType" : "m4.xlarge",
                "EbsVolumes" : [
                    {
                        "Device" : "/dev/sdb",
                        "VolumeId" : "vol-0255d0ae88dbbe78f"
                    },
                    {
                        "Device" : "/dev/sdc",
                        "VolumeId" : "vol-0092cf772c4cb49d6"
                    }
                ]
            }
          ...
        ]
    }

Cluster Description
~~~~~~~~~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae3acd76cd490f74997607"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr cluster description",
            "name" : "j-2KJT8GO4RV4VR",
            "collection" : "aws-emr cluster description",
            "created" : "2019-04-10 18:49:49.923422",
            "modified" : "2019-04-10 18:49:49.923422"
        },
        "data" : {
            "Id" : "j-XXXXXXXXXXXXX",
            "Name" : "NAME",
            "Status" : {
                "State" : "TERMINATED",
                "StateChangeReason" : {
                    "Code" : "USER_REQUEST",
                    "Message" : "Terminated by user request"
                },
                "Timeline" : {
                    "CreationDateTime" : ISODate("2019-04-04T01:38:26.595Z"),
                    "EndDateTime" : ISODate("2019-04-04T01:43:53.907Z")
                }
            },
            "Ec2InstanceAttributes" : {
                "RequestedEc2SubnetIds" : [ ],
                "Ec2AvailabilityZone" : "us-west-1c",
                "RequestedEc2AvailabilityZones" : [ ],
                "IamInstanceProfile" : "EMR_EC2_DefaultRole",
                "EmrManagedMasterSecurityGroup" : "sg-XXXXXXXXXXXXX",
                "EmrManagedSlaveSecurityGroup" : "sg-XXXXXXXXXXXXX"
            },
            "InstanceCollectionType" : "INSTANCE_GROUP",
            "ReleaseLabel" : "emr-5.22.0",
            "AutoTerminate" : false,
            "TerminationProtected" : false,
            "VisibleToAllUsers" : true,
            "Applications" : [
                {
                    "Name" : "Spark",
                    "Version" : "2.4.0"
                },
                {
                    "Name" : "Hadoop",
                    "Version" : "2.8.5"
                }
            ],
            "Tags" : [ ],
            "ServiceRole" : "EMR_DefaultRole",
            "NormalizedInstanceHours" : 0,
            "MasterPublicDnsName" : "ec2-54-193-70-173.us-west-1.compute.amazonaws.com",
            "Configurations" : [ ],
            "ScaleDownBehavior" : "TERMINATE_AT_TASK_COMPLETION",
            "KerberosAttributes" : {
                
            }
        }
    }

Copy File Request
~~~~~~~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae3c7576cd49129fde9fd7"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr copy file request",
            "name" : "test.md",
            "collection" : "aws-emr copy file request",
            "created" : "2019-04-10 18:56:53.568585",
            "modified" : "2019-04-10 18:56:53.568585"
        },
        "data" : {
            "StepIds" : [
                "s-XXXXXXXXXXXXX"
            ],
            "ResponseMetadata" : {
                "RequestId" : "077a0182-5bc2-11e9-a7ff-118a03244614",
                "HTTPStatusCode" : 200,
                "HTTPHeaders" : {
                    "x-amzn-requestid" : "077a0182-5bc2-11e9-a7ff-118a03244614",
                    "content-type" : "application/x-amz-json-1.1",
                    "content-length" : "30",
                    "date" : "Wed, 10 Apr 2019 18:54:11 GMT"
                },
                "RetryAttempts" : 0
            }
        }
    }

File Upload
~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae3c3576cd49120a3a0513"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr file upload",
            "name" : "test.md",
            "collection" : "aws-emr file upload",
            "created" : "2019-04-10 18:55:49.612897",
            "modified" : "2019-04-10 18:55:49.612897"
        },
        "data" : {
            "file" : "LICENSE",
            "bucket" : "BUCKET NAME",
            "bucketname" : "FILE NAME"
        }
    }

Run File Request
~~~~~~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae3c8e76cd4913333930cc"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr run file request",
            "name" : "main.py",
            "collection" : "aws-emr run file request",
            "created" : "2019-04-10 18:57:18.893398",
            "modified" : "2019-04-10 18:57:18.893398"
        },
        "data" : {
            "StepIds" : [
                "s-XXXXXXXXXXXXX"
            ],
            "ResponseMetadata" : {
                "RequestId" : "16944707-5bc2-11e9-ab7c-333f036e49a6",
                "HTTPStatusCode" : 200,
                "HTTPHeaders" : {
                    "x-amzn-requestid" : "16944707-5bc2-11e9-ab7c-333f036e49a6",
                    "content-type" : "application/x-amz-json-1.1",
                    "content-length" : "30",
                    "date" : "Wed, 10 Apr 2019 18:54:36 GMT"
                },
                "RetryAttempts" : 0
            }
        }
    }

Start Cluster Request
~~~~~~~~~~~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae3ba776cd4910291c2bbf"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr start cluster request",
            "name" : "temp12",
            "collection" : "aws-emr start cluster request",
            "created" : "2019-04-10 18:53:27.965266",
            "modified" : "2019-04-10 18:53:27.965266"
        },
        "data" : {
            "cluster" : "j-XXXXXXXXXXXXX",
            "name" : "NAME"
        }
    }

Stop Cluster Request
~~~~~~~~~~~~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae3c9c76cd4913c74b5060"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr stop cluster request",
            "name" : "j-XXXXXXXXXXXXX",
            "collection" : "aws-emr stop cluster request",
            "created" : "2019-04-10 18:57:32.779245",
            "modified" : "2019-04-10 18:57:32.779245"
        },
        "data" : {
            "name" : "j-XXXXXXXXXXXXX"
        }
    }

Step List
~~~~~~~~~

::

    {
        "_id" : ObjectId("5cae3ac276cd490f2ae1c8b7"),
        "cm" : {
            "cloud" : "aws",
            "kind" : "emr step list",
            "name" : "j-2KJT8GO4RV4VR",
            "collection" : "aws-emr step list",
            "created" : "2019-04-10 18:49:38.921115",
            "modified" : "2019-04-10 18:49:38.921115"
        },
        "data" : [
            {
                "Id" : "s-XXXXXXXXXXXXX",
                "Name" : "Run main.py",
                "Config" : {
                    "Jar" : "command-runner.jar",
                    "Properties" : {
                        
                    },
                    "Args" : [
                        "spark-submit",
                        "s3://BUCKET/FILENAME.py"
                    ]
                },
                "ActionOnFailure" : "CANCEL_AND_WAIT",
                "Status" : {
                    "State" : "CANCELLED",
                    "StateChangeReason" : {
                        "Message" : "Job terminated"
                    },
                    "Timeline" : {
                        "CreationDateTime" : ISODate("2019-04-04T01:42:11.574Z")
                    }
                }
            },
            ...
        ]
    }

HPC
---

Batch
~~~~~

Queue
~~~~~

Job
~~~

Keys
----

::

    {
        "_id" : ObjectId("5ca79c92dc64f1905d924234"),
        "name" : "gregor",
        "fingerprint" : "aa:aa:bb:11:22:33:88:98:13:74:8a:3b:6a:5a:b2:5d",
        "public_key" : "ssh-rsa xxxxxxxxx ... gregor@nowhere test",
        "private_key" : null,
        "extra" : {},
        "cm" : {
            "kind" : "key",
            "driver" : "openstack",
            "cloud" : "chameleon",
            "name" : "gregor",
            "collection" : "chameleon-key",
            "created" : "2019-04-05 18:21:06.898856",
            "modified" : "2019-04-06 06:50:30.975625"
        }
    }
