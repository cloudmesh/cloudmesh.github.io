
# ######################################################################
# Arguments
# ######################################################################
# {'--kind': 'rst', '--noheader': False, 'COMMAND': 'flow'}
# ######################################################################

flow
====

::

   Usage:
        flow list [--flow=NAME] [--output=FORMAT]
        flow add [--flowname=FLOWNAME] --flowfile=FILENAME
        flow run [--flowname=FLOWNAME] [--flowfile=FILENAME]
        flow node add NODENAME [--flowname=FLOWNAME]
        flow edge add FROM TO [--flowname=FLOWNAME]
        flow node delete NODENAME
        flow edge delete FROM TO
        flow edge invert FROM TO
        flow visualize start
        flow visualize stop
        flow refresh

   This command manages and executes workflows
   The default workflow is just named "workflow" but you can specify multiple

   Arguments:
      NAME       the name of the workflow
      FILENAME   a file name
      NODENAME   the name of the node
      FROM       the edge source (a node name)
      TO         the edge destination (a node name)
      NODE       the name of the node

   Options:
      --flow=NAME   the name or the flow
      --file    specify the file
      --log     specify the log file
      --flowname=FLOWNAME   the name or the workflow
      --output=OUTPUT       the output format [default: table]

