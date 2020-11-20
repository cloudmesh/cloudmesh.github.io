Infrastructure Workflow
=======================

Cloudmesh supports an infrastructure
`workflow <https://github.com/cloudmesh/cloudmesh-flow>`__ where users
can specify python functions and map their execution on cloud
infrastructure. The workflow feature allows you to define Python
functions on a workflow class, and specify when to execute them via the
command line or in a YAML file. You can then visualize the result of
your workflow execution.

An example is given next.

.. code:: python

   from cloudmesh.flow.WorkFlow import BaseWorkFlow

   class MyFlow(BaseWorkFlow):

       def a(self):
           print("in a!")
           time.sleep(5)

       def b(self):
           print("in b!")
           time.sleep(10)

       def c(self):
           print("in c!")
           time.sleep(10)

This allows you to define functions in your workflow file. Then you can
write a specification for the sequence to execute your functions:

::

   (a; b || c)

Where

-  ``a ; b`` is executed sequentially
-  ``b || c`` is executed in parallel.

Finally, after execution the results are stored in MongoDB to be
visualized or consumed by later functions in the series.

Database Objects
----------------

There are two collections related to workflow objects. The first is for
the definition of a flow, and the second for the status of a flow that
is in progress.

Definition Collection
~~~~~~~~~~~~~~~~~~~~~

When you define a workflow, a new collection is created for the
definition. For a workflow named “test”, this collection exists at
“test-flow”. This collection contains objects that look like the
following:

.. code:: json

   {
       "name" : "pytesta",
       "dependencies" : [],
       "workflow" : "test",
       "cm" : {
           "kind" : "flow",
           "cloud" : "test",
           "name" : "pytesta",
           "collection" : "test-flow",
           "created" : "2019-05-02 00:32:11.034870",
           "modified" : "2019-05-02 00:32:11.034870"
       },
       "kind" : "flow",
       "cloud" : "test",
       "status" : "defined"
   }

The salient features are ``name``, which is the name of the node, and
``dependencies`` which is an array of other node names this node depends
upon. All elements in a flow definition collection will have
``status : "defined"``.

Running Flow Collection
~~~~~~~~~~~~~~~~~~~~~~~

When a flow is started with

.. code:: bash

   cms flow run

A new collection is started with the suffix “-active” added at the end.
For example, if your flowname is ``test`` and your nodes are defined in
``test-flow``, then the active collection in MongoDB will be
``test-flow-active``. Objects in this collection are similar to the
above, with two changes:

1. First, they have a ``result`` field attached, which holds the JSON
   value from the result of executing the node and
2. They have a richer ``status`` field, with the following values:

   -  ``pending`` is the status when the flow starts
   -  ``running`` is the status when a node is being executed
   -  ``finished`` is the status when the node has executed
   -  ``error`` is the status when a node finished execution with a
      non-zero exit code

When interacting directly with the database, it is important to use the
values from the definition collection unless you are explicitly
interacting with a flow in progress. The running collection may not be
up-to-date and may contain incorrect information. For example the
``dependencies`` array in the definition collection reflects the overall
dependencies specified in the flow definition but in the running
collection the array is continually modified whenever other nodes finish
their work.

Javascript Interface (proposed)
-------------------------------

We are looking for someone that would chose as its project to include a
rendering of some DAG in javascript. The javascript library must be free
to use. Nodes and edges must be able to be labeled.

A promising start for a Javascript library is

-  http://visjs.org/network_examples.html
-  http://visjs.org/examples/network/events/interactionEvents.html

This project is only recommended for someone that knows javascript
already.

You will do the rest of the project in python. It is important that the
functions be specified in python and not just Javascript. The focus is
not on specifying the DAG with a GUI, but to visualizing it at runtime
with status updates

Here is another summary that we posted earlier and is probably better as
it has a dict return

So what we want to do is something i have done previously somewhere with
graphviz, but instead of using graphviz we use java script. W want to
define tasks that depend on each other. The tasks are defined as python
functions. The dependencies are specified via a simple graph string

.. code:: python


    
   def a (); print("a"); sleep(1) ; return {"status": "done", "color":"green", shape:"circle", label="a"}

   def b (); print("b"); sleep(2); return{"status": "done", "color":"green", shape:"circle", label="b"}

   def b (); print("c"); sleep(3); return{"status": "done", "color":"green", shape:"circle", label="c"}

    
   w = workflow("a; b | c")

   ; = sequential

   | = parallel


   w.run()

While executing the javascript would change dynamically the state and
color after a calculation is completed. The workflow should also be able
to be specified in yaml

Here just one idea:

::

   tasks:
       task:
         name: a
         parameter:
            x: "int"
            y:: "int"
         calculation: f(x,y) 
         entry:
            color: green
            label: a
            value: x (this is a python variable local to the function
            shape: circle
         return:
            color: green
            label: a
            value: x (this is a python variable local to the function
            shape: circle

Naturally at one point f(x,y) will be cloud related such as starting a
vm and executing a command in teh vm ….

Followup:

We added a value to the return. Values can be any object.

.. code:: python

   def a():
       x = 10
       return {"status": "done", 
               "color": "green", 
               "shape": "circle", 
               "label": "c", 
               "value": x}

REST
----

An OpenAPI specification for this is to be defined.

Resources
---------

-  https://github.com/xflr6/graphviz
-  http://visjs.org/examples/network/events/interactionEvents.html
-  This work is influenced by https://github.com/cloudmesh/workflow
