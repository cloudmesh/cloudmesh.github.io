register list sample --service=compute --kind=oracle

Configuration for Cloud=oracle Service=cloud
--------------------------------------------

::

    cloudmesh:
      cloud:
        {name}:
          cm:
            active: true
            heading: {name}
            host: TBD
            label: {name}
            kind: oracle
            version: TBD
            service: compute
          default:
            image: ami-0f65671a86f061fcd
            size: t2.micro
          credentials:
            user: {user}
            fingerprint: {fingerprint}
            key_file: ~/.oci/oci_api_key.pem
            pass_phrase: {pass_phrase}
            tenancy: {tenancy}
            compartment_id: {compartment_id}
            region: us-ashburn-1

To register this service the following parameter ned to be defined::

    compartment_id
    fingerprint
    name
    pass_phrase
    tenancy
    user


Timer: 0.0000s Load: 0.0000s (line_strip)
