Cloudmesh Compute
=================

-  This project can also be taken as independent study or as part of the
   Cloud Engineering class

Goals
-----

In this project you will be developing a features related to completing
and simplifying the compute interface to an existing cloud. You will
also benchmark the clouds while comparing the computations on similar
operating systems that are deployed on different clouds.

Each team member will need to work with two clouds, from which

-  the first cloud is OpenStack
-  the second cloud is one of AWS, Azure, Google
-  an alternative to the clouds can also be devstack, VirtualBox and
   docker (however the providers are not completed and may require more
   work)

Each team member must work on 1 + number of team members different
clouds. Teams are limited to 2 team members. If a feature in the cloud
is missing that needs to be there to support cloudmesh it is to be
implemented.

Benchmarks must not only include the execution time of a program in the
cloud , but also measure how much time it costs to manage basic
functionality for

-  images
-  flavors
-  virtual machines
-  keys
-  security groups

Requirements
------------

Basic knowledge of python or a programming language as all programming
is done in python. Python is easy to learn. Access to a cloud other than
OpenStack. We will provide access to OpenStack.

Difficulty
----------

*easy*: For clouds that are already implemented in cloudmesh this
project is easy. We may require individual students to target more than
2 clouds. We will figure this out at the beginning of your project

*moderate*: For Google Cloud the task is moderate as we need to improve
the provider.

*moderate*: The virtual box provider is developed via vagrant and in
principal works, but has not been worked on for a while. You will be in
improving the provider in cloudmesh

Deliverables
------------

-  Working benchmarks in form of reproducable pytests. Examples are
   included in cloudmesh-cloud
-  checkins into github by all team members. If only one team member
   checks in all other team members will not get credit.
-  Collaborate with *all* teams that do this project so we can get
   benchmarks for all clouds and compare the results not only within
   your team, but all teams.
