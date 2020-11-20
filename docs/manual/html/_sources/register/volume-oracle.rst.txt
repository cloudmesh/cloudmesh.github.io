register list sample --service=volume --kind=oracle

Configuration for Cloud=oracle Service=volume
---------------------------------------------

::

    cloudmesh:
      volume:
        {name}:
          cm:
            active: true
            heading: {name}
            host: TBD
            label: {name}
            kind: oracle
            version: TBD
            service: volume
          credentials:
            version: TBD
            user: TBD
            fingerprint: TBD
            key_file: oci_api_key.pem
            pass_phrase: TBD
            tenancy: TBD
            compartment_id: TBD
            region: TBD
            availability_domain: TBD
          default:

To register this service the following parameter ned to be defined::

    name


Timer: 0.0000s Load: 0.0000s (line_strip)
