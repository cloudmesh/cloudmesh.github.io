register list sample --service=volume --kind=openstack

Configuration for Cloud=openstack Service=volume
------------------------------------------------

::

    cloudmesh:
      volume:
        openstack:
          cm:
            active: true
            heading: Chameleon
            host: chameleoncloud.org
            label: chameleon
            kind: openstack
            version: train
            service: volume
          credentials:
            auth:
              username: TBD
              password: TBD
              auth_url: https://kvm.tacc.chameleoncloud.org:5000/v3
              project_id: TBD
              project_name: cloudmesh
              user_domain_name: Default
            region_name: KVM@TACC
            interface: public
            identity_api_version: '3'
            key_path: TBD/id_rsa.pub
          default:
            size: 1
            volume_type: __DEFAULT__


To register this service the following parameter ned to be defined::

    


Timer: 0.0000s Load: 0.0000s (line_strip)
