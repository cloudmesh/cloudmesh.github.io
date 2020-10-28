Virtual Machine Providers
=========================

Cloudmesh is based on the concept of providers that make it possible to develop
API interfaces for different services independently while inheriting the
functionality form a comman abstract class.


Let us demonstarte the concept of abstract providers for compute
providers. We assume that the source diectories are stored in ~/cm.
We have the following structure::

    ~/cm/cloudmesh-abstract/cloudmesh/abstract/ComputeNodeABC.py
    ~/cm/cloudmesh-cloud/cloudmesh/vm/Provider.py

    ~/cm/cloudmesh-openstack/cloudmesh/openstack/compute/Provider.py
    ~/cm/cloudmesh-aws/cloudmesh/aws/compute/Provider.py
    ~/cm/cloudmesh-aws/cloudmesh/azure/compute/Provider.py
    ~/cm/cloudmesh-aws/cloudmesh/oracle/compute/Provider.py
    ~/cm/cloudmesh-aws/cloudmesh/google/compute/Provider.py                    
            ...

Here the ABC class determines which methods must be implemented by the
main cloud provider. This provider than delectes the activity to the
cloud provider that is determinded by the internal cloudmesh `cloud`
variable. To simplify authentication, the credentials can be stored in
the cloudmesh.yaml file.


Example: The yaml file ~/.cloudmesh/cludmesh.yaml contains the entry::

    cloudmesh:
      compute: # currently called cloud
        mycloud:
          cm:
            name: maycloud
            kind: aws
          credentials:
            ...
          defaults:
            size: ...
            image: ...

Now when we call::

    provider = cloudmesh.compute.Provider(service="mycloud")


The Provider will load in the provider from the aws directory, as the cm.kind
is specified as `aws`. Thus the main provider delegates the tasks to interface
with teh particular cloud type via the definitions coming from the cloudmesh
yaml file. This makes it possible to easily create multiple interface sto
different cloud service providers while managing a uniform interface via the
ABC class. All providers in this hierarchie must innherit from the ABC class.

Deatils of a virtual machine provider
~~~~~~~~~~~~~~~---------------~~~~~~~

Here we list in more details how a virtual machine provider can look like::

    ~/cm/

        cloudmesh-compute/  #curertly named cloudmes-cloud
            cloudmesh/compute
                ComputeABC.py
                Provider.py
                command/vm.py
                command/image.py
                command/flavor.py

        cloudmesh-aws/
            cloudmesh/
                aws/Provider.py

        cloudmesh-azure/
            cloudmesh/
                azure/Provider.py

In this case we have includes in the compute provider imports for the providers
defined in their own reporsitories. As we use the shared namespace they can be
accessed from the main provider easily. THis allows us to simply add the
provider with a simple pip install::

    cd ~/cm/cloudmesh-compute/
    pip install .
    cd ~/cm/cloudmesh-aws/
    pip install .
    cd ~/cm/cloudmesh-azure/
    pip install .

Now the aws and azure providers are accessible in cloudmesh and if a command is
provided they can bae accessed from there.


