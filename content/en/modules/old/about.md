---
date: 2016-04-09T10:58:08-04:00
description: "Version 0"
featured_image: "/images/cloud2.jpg"
tags: ["1"]
title: "Version 0"
---

This page summarizes the early development of cloudmesh.


## Features

-   Easy management of multiple clouds in cloudmesh while supporting
    various native libraries.
-   Portability library to access information in regards to images,
    flavors, and vms
-   Management of hundreds/thousands of virtual machines
-   Integration of non FutureGrid cLouds by users into cloudmesh so
    users can access them from cloudmesh
-   A command line shell
-   A web interface
-   Local install of cloudmesh

## Cloudmesh 0.1

Cloudmesh is part of the effort of FutureGrid to provide a simple
experiment management functionality. It has been used at IU for about 9
month.

Originally cloudmesh was just a [command line
tool](https://github.com/futuregrid/cm) that was able to start hundreds
of VMs on various clouds in order to conduct stress testing of cloud
deployments. There was no comparable tool available. Our requirements
were simple, but none of the tools fulfilled the following requirements:

-   start hundreds of VMs from the command line with a simple command
-   delete the VMs from a user through the command line
-   provide native support of the cloud and not just using a wrapper
    library such as libcloud or a standard such as OCCI (we wanted to
    debug the cloud and not the wrapper libraries or standards)
-   provide an elementary display on which VMs run where.
-   users should be able to deploy a stand alone version of cloudmesh

Through this tool we were able to identify issues with our clouds and
improve the deployment.

Other tools that we tried to use were hiding these issues as they for
example did not use the native API protocol, but instead used
alternative protocols such as EC2 in case of our OpenStack clouds. As a
user this may be ok, but as a resource provider such limitation is
naturally problematic.

## Cloudmesh 0.2

Next we replaced the curses based user interface with a web browser
based user interface. This made it possible to more easily develop more
sophisticated interfaces in General.

At the same time we reused our python command shell interpreter cmd3 so
that it is more easily possible to develop command line tools
automatically from the commands we already developed as part of the
command shell anyways.

A command shell is obviously important as it allows us to describe
experiments as scripts.

## Cloudmesh 0.3

Base on the success from the earlier versions and the use of a web
browser as interface, it became clear that users could benefit from our
effort. Thus we started to generalize the framework a bit and work
towards distributing cloudmesh as a single user environment while users
can install a stand alone version of the software.

Based on this internal success of cloudmesh we started thinking it would
be good to expose the functionality also to users.

## Cloudmesh 0.4

In cloudmesh 0.4 we transformed the store of the VM, flavor, and images
into a database, we also moved the development of the code in a new
[Github Cloudmesh](https://github.com/cloudmesh/cloudmesh) repository.

## Cloudmesh 0.5 - 0.7

The following important changes took place:

-   introduction of a role based authentication theme
-   adding FG authentication from the portal account
-   ingesting users either from a yaml file or LDAP directory
-   adding capabilities to list vms, flavors, and images from AWS
-   adding capabilities to list vms, flavors, and images from Azure
-   adding capabilities to list vms, flavors, and images from EC2 (via
    libcloud)
