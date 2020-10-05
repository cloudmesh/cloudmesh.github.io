---
date: 2016-04-09T10:58:08-04:00
description: "Cloudmesh 1"
featured_image: "/images/cloud2.jpg"
tags: ["1"]
title: "Cloudmesh 1"
---


At this time we are focussing on Cloudmesh 3 and are not using Cloudmesh
1 features. However Cloudmesh 1 could still be useful.

  --------------------------------------------------------------------------------------------------------------------------------------------------
  Feature               Description                                         Image
  --------------------- --------------------------------------------------- ------------------------------------------------------------------------
  Cloudmesh Core        A project to interface easily with multiple clouds  ![image-registry](_static/cloud_register_openstack.png){width="100px"}
                        from the command line and a command shell.          
                        [github](https://github.com/cloudmesh/cloudmesh),   
                        [doc](http://cloudmesh.github.io/cloudmesh/)        

  Convenient Command    Cloudmesh contains a nice command shell that goes   ![image-cmd3](_static/cmd3.png){width="100px"}
  Shell                 beyond a simple commandline interface. State can be 
                        saved between command invocations.                  

  Cloudmesh Metric for  Cloudmesh contains a metric report system that id   ![image-metric](_static/metric.png){width="100px"}
  Clouds                used can provide customized reports.                

  Cloudmesh Inventory   Cloudmesh has a simple inventory that allows system ![image-inventory](_static/inventory.png){width="100px"}
                        administrators and users to easily manage resource  
                        inventory in inventory datatables. The attributes   
                        in that table can be defined by the user            

  Cloudmesh PaaS        Cloudmesh has the ability to interface with various ![image-launcher](_static/launcher.png){width="100px"}
  Launcher              DevOps frameworks. Through them we expose via       
                        simple command tools the ability to conveniently    
                        launch platforms. Examples are virtual clusters on  
                        OpenStack, Apache storm and others. We have an easy 
                        way to integrate additional platforms into the      
                        command shell through an automatic code generator   
                        for command additions.                              

  Cloudmesh Federated   Cloudmesh allows the federated management of VMs    ![image-manage-vms](_static/manage_vms.png){width="100px"}
  VMs                   through one interface. This allows us to use        
                        CLoudmesh as an onramp                              

  Cloudmesh HPC Batch   Cloudmesh includes the ability to view HPC queues.  ![image-qinfo](_static/qinfo.png){width="100px"}
  Processing            Most recently we have added a simple API to also    ![image-qstat](_static/qstat.png){width="100px"}
                        submit jobs. Our goal is to be able to manage       
                        millions of jobs submitted to a Computational Grid, 
                        but also user managed heterogeneous sets of         
                        clusters that may not be port of a national or      
                        international Grid infrastructure.                  

  Cloudmesh Service Map For locally maintained resources, Cloudmesh         ![image-service-map](_static/service_map.png){width="100px"}
                        provides the ability to visualize a service map. We 
                        will be expanding upon this effort to integrate     
                        with our new inventory. This makes it possible to   
                        for example display services mapped onto compute    
                        servers, but also concrete sensor information such  
                        as temperature of the servers                       
  --------------------------------------------------------------------------------------------------------------------------------------------------
