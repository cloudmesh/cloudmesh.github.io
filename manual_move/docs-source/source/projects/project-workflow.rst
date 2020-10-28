Cloudmesh Workflow
==================

-  This project can also be taken as independent study or as part of the
   Cloud Engineering class

Goals
-----

In this project you will be developing a workflow framework allowing
cloudmesh shell tasks to be executed in a workflow engine. The workflow
engine will be integrated with the cloudmesh backend database.

Workflows will bes specified with the help of python functions. These
functions will than be added to a quue. Futures are used to identify
runable functions which will be executed as soon as their parameters are
defined.

A graphical user interface based on javascript Electron needs to be
developed as part of this project. A preliminary code is available in
github at

-  https://github.com/cloudmesh/workflow

The current implementation does not have parameter management included.

Requirements
------------

-  Strong knowledge of python of the student working on the backend.
-  Knowledge of javascript of teh student working on the graphical
   interface

Difficulty
----------

-  *moderate*: The complexity of this project is moderate and allows you
   to look at advanced python language concepts as well as basic
   javascript features for rendering the workflow in real time. You will
   need to understand multiprocessing in python. An example is provided
   in the Host.ping class in cloudmesh-cloud

Deliverables
------------

-  Working benchmarks in form of reproducable workflows embedded in
   pytests
-  checkins into github by all team members. If only one team member
   checks in all other team members will not get credit.
-  benchmark of the tasks while reporting the results into the database
-  Definition of the objects stored in the database.
