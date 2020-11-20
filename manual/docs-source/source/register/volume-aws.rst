register list sample --service=volume --kind=aws

Configuration for Cloud=aws Service=volume
------------------------------------------

::

    cloudmesh:
      volume:
        {name}:
          cm:
            active: true
            heading: AWS
            host: aws.com
            label: VAWAS1
            kind: aws
            version: TBD
            service: volume
          default:
            volume_type: gp2
            size: TBD
            encrypted: False
            region_name: {region_name}
            region: {availability_zone}
            snapshot: "None"
          credentials:
            EC2_SECURITY_GROUP: default
            EC2_ACCESS_ID: {aws_access_key_id}
            EC2_SECRET_KEY: {aws_secret_access_key}
            EC2_PRIVATE_KEY_FILE_PATH: {private_key_file_path}
            EC2_PRIVATE_KEY_FILE_NAME: {private_key_file_name}

To register this service the following parameter ned to be defined::

    availability_zone
    aws_access_key_id
    aws_secret_access_key
    name
    private_key_file_name
    private_key_file_path
    region_name


Timer: 0.0000s Load: 0.0000s (line_strip)
