register list sample --service=compute --kind=openstack

Configuration for Cloud=openstack Service=cloud
-----------------------------------------------

::

    cloudmesh:
      cloud:
        {name}:
          cm:
            active: true
            heading: {name}
            host: TBD
            label: {name}
            kind: openstack
            version: TBD
            service: compute
          credentials:
            auth:
              auth_url: "https://kvm.tacc.chameleoncloud.org:5000/v3"
              username: TBD
              project_id: {project_id}
              project_name: {project_name}
              user_domain_name: "Default"
              password: TBD
            region_name: {region}
            interface: "public"
            identity_api_version: "3"
            key_path: ~/.ssh/id_rsa.pub
          default:
            size: m1.medium
            image: CC-Ubuntu18.04
            username: TBD
            network: {network_id}

To register this service the following parameter ned to be defined::

    name
    network_id
    project_id
    project_name
    region


Timer: 0.0000s Load: 0.0000s (line_strip)
