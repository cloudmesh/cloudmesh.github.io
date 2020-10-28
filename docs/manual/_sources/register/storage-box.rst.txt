register list sample --service=storage --kind=box

Configuration for Cloud=box Service=storage
-------------------------------------------

::

    cloudmesh:
      box:
        cm:
          active: false
          heading: Box
          host: box.com
          label: box
          kind: box
          version: TBD
          service: storage
        default:
          directory: /
        credentials:
          config_path: ~/.cloudmesh/box/{config}

To register this service the following parameter ned to be defined::

    config


Timer: 0.0000s Load: 0.0000s (line_strip)
