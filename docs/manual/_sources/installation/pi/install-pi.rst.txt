Prerequisites for Raspbian
^^^^^^^^^^^^^^^^^^^^^^^^^^

Setup with curl
---------------

.. todo:: integrate the curl command



.. mermaid::



   graph TD
      keygen(ssh-keygen fa:fa-key)
      curl("curl -Ls http://cloudmesh.github.io/get/pi | sh")
      pip(pip install cloudmesh-openstack)
      cms(cms help)
      start(Start) --> keygen --> curl --> pip --> cms

      style start stroke:#333,stroke-width:4px
      style cms stroke:#333,stroke-width:4px
