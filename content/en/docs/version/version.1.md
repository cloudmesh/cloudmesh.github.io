---
date: 2016-04-09T10:58:08-04:00
description: "Version 1"
featured_image: "/images/cloud2.jpg"
tags: ["1"]
title: "Cloudmesh Version 1"
weight: 80
---

At this time we are focussing on Cloudmesh 3 and are not using Cloudmesh
1 features. However Cloudmesh 1 could still be useful.

Feature               | Description                                         | Image
--------------------- | --------------------------------------------------- | ------------------------------------------------------------------------
Cloudmesh Core        | A project to interface easily with multiple clouds from the command line and a command shell. [github](https://github.com/cloudmesh/cloudmesh), [doc](http://cloudmesh.github.io/cloudmesh/) | ![image-registry](../images/cloudmesh/cloud_register_openstack.png)
Convenient Command Shell   |  Cloudmesh contains a nice command shell that goes beyond a simple commandline interface. State can be saved between command invocations. |  ![image-cmd3](../images/cmd3.png) |
Cloudmesh Metric for Clouds  | Cloudmesh contains a metric report system that id used can provide customized reports. | ![image-metric](../images/cloudmesh/metric.png)
Cloudmesh Inventory   | Cloudmesh has a simple inventory that allows system administrators and users to easily manage resource inventory in inventory datatables. The attributes in that table can be defined by the user | ![image-inventory](../images/cloudmesh/inventory.png) |
Cloudmesh PaaS Launcher | Cloudmesh has the ability to interface with various DevOps frameworks. Through them we expose via simple command tools the ability to conveniently launch platforms. Examples are  clusters on OpenStack, Apache storm and others. We have an easy way to integrate additional platforms into the command shell through an automatic code generator for command additions. | ![image-launcher](../images/cloudmesh/launcher.png) |
Cloudmesh Federated VMs  | Cloudmesh allows the federated management of VMs  through one interface. This allows us to use Cloudmesh as an onramp | ![image-manage-vms](../images/cloudmesh/manage_vms.png) |
Cloudmesh HPC Batch Processing | Cloudmesh includes the ability to view HPC queues.  Most recently we have added a simple API to also submit jobs. Our goal is to be able to manage millions of jobs submitted to a Computational Grid, but also user managed heterogeneous sets of clusters that may not be port of a national or international Grid infrastructure.  | ![image-qinfo](../images/cloudmesh/qinfo.png) ![image-qstat](../images/cloudmesh/qstat.png)
Cloudmesh Service Map | For locally maintained resources, Cloudmesh provides the ability to visualize a service map. We will be expanding upon this effort to integrate with our new inventory. This makes it possible to for example display services mapped onto compute servers, but also concrete sensor information such as temperature of the servers        | ![image-service-map](../images/cloudmesh/service_map.png)




