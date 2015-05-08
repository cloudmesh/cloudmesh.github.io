Cloudmesh
======================================================================

Cloudmesh is a project to easily manage virtual machines and bare
metal provisioned operating systems in a multicloud environment. We
are also providing the ability to deploy platforms.

Documentation
----------------------------------------------------------------------

A user oriented documentation is available as part of an evolving
`Introduction to Cloud Computing
<http://cloudmesh.github.io/introduction_to_cloud_computing>`__ with
Cloudmesh. Links to additional documentation of the Cloudmesh projects
is provided on the `Projects page <projects.html>`__ page.



Features
----------------------------------------------------------------------

.. list-table:: 
   :widths: 30 60 10
   :header-rows: 1

   * - Feature
     - Description
     - Image
   * - Cloudmesh Core
     - A project to interface easily with multiple clouds from the command line and a command shell.
       `github <https://github.com/cloudmesh/cloudmesh>`_,
       `doc <http://cloudmesh.github.io/cloudmesh/>`_
     - |image-registry|
   * - Layered Extensible Architecture 
     - Cloudmesh has a layered architecture that allows easy
       development of new features. This also allows more easy
       contribution by the community while developing integrated and
       smoler sub components.
     - |image-arch|
   * - Convenient Command Shell 
     - Cloudmesh contains a nice command shell that goes beyond a
       simple commandline interface. State can be safed between
       command invocations.
     - |image-cmd3|
   * - Cloudmesh an On-ramp to Clouds 
     - Cloudmesh can be used as an on-ramp to clouds and even HPC
       services. This makes it possible to use Azure, AWS, OpenStack,
       and other clouds as well as HPC batch systems in the same
       framework easily. 
     - |image-onramp|
   * - Cloudmesh Metric for Clouds 
     - Cloudmesh contains a metric report system that id used can
       provide customized reports.
     - |image-metric|
   * - Cloudmesh Inventory
     - Cloudmesh has a simple inventory that allows system
       administrators and useres to easily manage resource inventory
       in inventory datatables. The attributes in that table can be
       defined by the user
     - |image-inventory|
   * - Cloudmesh PaaS Launcher
     - CLoudmesh has the ability to interfave with various DevOps
       frameworks. Through them we expose via simple command tools the
       ability to conveniently launch platforms. Exampls are virtual
       clusters on OpenStack, Apache storm and others. We have an easy
       way to integrate additional platforms into the command shell
       through an automatic code generator for command additions.
     - |image-launcher|
   * - Cloudmesh Federated VMs 
     - Cloudmesh allows the federated management of VMs through one
       interface. This allows us to use CLoudmesh as an onramp
     - |image-manage-vms|
   * - Cloudmesh HPC Batch Processing
     - Cloudmesh includes the ability to view HPC queues. Most
       recently we have added a simpl API to also submit jobs. Our
       goal is to be able to manage millions of jobs submitted to a
       Computational Grid, but also user managed heterogeneous sets
       of clusters that may not be paort of a national or
       international Grid infrastructure.
     - |image-qinfo|
   * - 
     -
     - |image-qstat|
   * - Cloudmesh Service Map
     - For locally maintained resources, Cloudmesh provides the
       ability to visualize a service map. We will be expanding upon
       this effort to integrate with our new inventory. THis makes it
       possible to for example display services mapped onto compute
       servers, but also concrete sensor information such as
       temperature of the servers
     - |image-service-map| 
		 
		 
 
.. |image-arch| image:: _static/cloudmesh-arch-2013.png
   :width: 100px

.. |image-cmd3| image:: _static/cmd3.png
   :width: 100px

.. |image-onramp| image:: _static/Slide1.png
   :width: 100px

.. |image-metric| image:: _static/metric.png
   :width: 100px

.. |image-inventory| image:: _static/inventory.png
   :width: 100px

.. |image-launcher| image:: _static/launcher.png
   :width: 100px

.. |image-manage-vms| image:: _static/manage_vms.png
   :width: 100px

.. |image-qinfo| image:: _static/qinfo.png
   :width: 100px
.. |image-qstat| image:: _static/qstat.png
   :width: 100px
.. |image-registry| image:: _static/cloud_register_openstack.png
   :width: 100px
.. |image-service-map| image:: _static/service_map.png
   :width: 100px



Cloudmesh
----------------------------------------------------------------------

.. toctree::
   :maxdepth: 1

   self
   cloudmesh
   projects
   cloud
   rain    
   hpc
   faq
   contact
   screenshots
   bib




