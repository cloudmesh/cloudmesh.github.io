CM4 Details (outdated)
======================

In cloudmesh, we are using the **Python** tool to implement a program
that could remotely control cloud nodes provided by different
organizations and run experiments in parallel.

The goal of ``cloudmesh`` is to provide a platform that users could
directly control the nodes they have, like AWS, Azure, and OPENSTACK
instances. Users could decide to start, stop, destroy, create, resume,
and suspend different nodes without accessing the **Console** interfaces
of providers. Then users could install experiment environment, software,
and other required tools in these running nodes. Finally, an experiment
could be executed in running nodes by sending the commands from
``cloudmesh`` platform. Meanwhile, we embed the NoSQL database
``cloudmesh`` platform. Meanwhile, we embed the NoSQL database
**MongoDB** into cloudmesh for managing the nodes and experiments.

Getting the config object
-------------------------

.. code:: python

   from cloudmesh.cloud.configuration.config import Config
   config = Config().data["cloudmesh"]

Getting values
--------------

To get values from the configurations, you can call level by level from
top-down config.

.. code:: python

   MONGO_HOST = config["data.mongo.MONGO_HOST"]

Using the Counter file
----------------------

CM4 keeps track of all the VMs running using counters for each VM. The
counter file is located at

.. code:: bash

   ~/.cloudmesh/counter.yaml

Using the counter
-----------------

.. code:: python

   from cloudmesh.cloud.configuration.counter import Counter
   counter = Counter()



Data Scheme in MongoDB
----------------------

There are three types of documents in MongoDB:

-  Node information in ``cloud`` collection. Different cloud service
   providers would return different schemas of node information. It is
   hard to manipulate different nodes’ information into same schema, so
   we decide to dump the return mesaage into MongoDB without any
   changes.

-  Node’s experiment status in ``status`` collection. The document in
   ``status`` collection is going to save the information of experiments
   executed in a node.

   .. code:: text

      {'_id': node_id,
      'status': status,
      'currentJob': job_id,
      'history' : the history of executed experiments in this node}

-  Experiment information in ``job`` collection.

   .. code:: text

      {'_id': experiment_id
      'name': name,
      'status': status,
      'input': input_info,
      'output': output_info,
      'description': description,
      'commands': commands}

-  Group information in ``group`` collection.

   .. code:: text

      {'cloud': cloud,
      'name': name,
      'size': size,
      'vms': list_vms}


The Virtual Machine Provider
----------------------------

In ``cloudmesh``, we developed the ``cloudmesh-cloud/vm/Vm.py`` class to
implement the operations for different virtual machines from AWS, Azure,
and Chameleon by using the python library `Apache
Libcloud <https://libcloud.apache.org>`__ to interact with cloud service
providers.

The basic functions are:


start(vm_name)
  start the virtual machine with specified name

stop(vm_name, deallocate)
  stop the virtual machine with specified name

resume(vm_name)
  resume the suspended virtual machine with specified name

suspend(vm_name)
  suspend the running virtual machine with specified name

destroy(vm_name)
  destroy the virtual machine with specified name

list()
  list all virtual machine in your cloud service account

status(vm_name)
  show the working status of virtual machine with specified name

info(vm_name)
  show all information about the virtual machine with specified name

get_public_ips(vm_name)
  return the public ip of the virtual machine with specified name

set_public_ip(vm_name, public_ip)
  set the public ip for the virtual machine with specified name

remove_public_ip(vm_name)
  remove the public ip from virtual machine with specified name

Next we list some sample of running these functions for virtual
machines in AWS, Azure and Openstack.

AWS VM Operations (Yu)
----------------------

Before using the AWS Vm code, user has to update their AWS information
into ``cloudmesh.yaml`` file in *etc* folder.

The *Libcloud* library has enough methods to support the operations for
managing virtual machines in AWS. We use a ``cloudmesh-cloud/vm/Aws.py``
to create the driver based on the configuration to connect to AWS.

Inherit the *Libcloud* library, we did some modifications on
``AWSDriver`` to extend the operation. The ``create_node`` method would
create a virtual machine in AWS based on the configuration of
``cloudmesh.yaml`` file

Here are some samples for running these operations by using
``cloudmesh-cloud``:

First, user would create the virtual machine in AWS.

.. code:: bash

   $ cms vm create
   Collection(Database(MongoClient(host=['127.0.0.1:27017'],
              document_class=dict, tz_aware=False, connect=True),
              'cloudmesh'), 'cloud')
   Thread: updating the status of node
   Created base-cloudmesh-yuluo-4
   PING 52.39.13.229 (52.39.13.229): 56 data bytes

   --- 52.39.13.229 ping statistics ---
   1 packets transmitted, 0 packets received, 100.0% packet loss

VM Refactoring
--------------

In addition, in order to offer more flexibilities to our users, we also
developed vmrefactor (``cloudmesh-cloud/vm/VmRefactor.py``) to allow
users to customize the flavors of their running instances and services
in different providers.

resize(vm_name, size)
   resize the virtual machine with specified size object
confirm_resize(vm_name)
   some providers requires confirmation message to complete resize() operation
revert(vm_name)
   revert a resize operation. Revert the virtual machine to previous status
rename(vm_name, newname)
   rename the virtual machine
rebuild(vm_name, image)
   rebuild the virtual machine to another image/OS with image object.

Currently, major providers usually charge users according to their
usage. It might be finacially wise sometimes to shift between different
service size to reduce unnecessary cost. VmRefactor is designed based on
this idea to help users to achieve higher cost efficiency. VmRefactor
can also help users navigate thier management tasks especially when they
have many different tasks on the run=.
