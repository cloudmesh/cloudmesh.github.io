register list sample --service=storage --kind=awss3

Configuration for Cloud=awss3 Service=storage
---------------------------------------------

::

    cloudmesh:
      storage:
        {name}:
          cm:
            active: true
            heading: homedir
            host: aws.com
            label: home-dir
            kind: awss3
            version: TBD
            service: storage
          default:
            directory: TBD
          credentials:
            name: {username}
            bucket: {container_name}
            container: TBD
            access_key_id: {aws_access_key_id}
            secret_access_key: {aws_secret_access_key}
            region: {region_name}

To register this service the following parameter ned to be defined::

    aws_access_key_id
    aws_secret_access_key
    container_name
    name
    region_name
    username


Timer: 0.0000s Load: 0.0000s (line_strip)
