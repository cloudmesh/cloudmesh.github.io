register list sample --service=volume --kind=google

Configuration for Cloud=google Service=volume
---------------------------------------------

::

    cloudmesh:
      volume:
        {name}:
          cm:
            active: true
            heading: {name}
            host: cloud.google.com
            label: {name}
            kind: google
            version: v1
            service: volume
          default:
            zone: us-central1-a
            type: projects/{project_id}/zones/{zone}/diskTypes/pd-standard
            sizeGb: 10
          credentials:
            project_id: {project_id}
            path_to_service_account_json: ~/.cloudmesh/service_account.json

To register this service the following parameter ned to be defined::

    name
    project_id


Timer: 0.0000s Load: 0.0000s (line_strip)
