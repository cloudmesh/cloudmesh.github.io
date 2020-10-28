register
========

.. parsed-literal::

    Usage:
        register list [--service=SERVICE] [--kind=KIND]
        register list sample --kind=KIND [--service=SERVICE]
        register remove --kind=KIND [--service=SERVICE] [--name=NAME]
        register update --kind=KIND [--service=SERVICE]
                                    [--name=NAME]
                                    [--filename=FILENAME]
                                    [--keep]
                                    [ATTRIBUTES...]
                                    [--dryrun]

        This command adds the registration information in the cloudmesh
        yaml file. A FILENAME can be passed along that contains
        credential information downloaded from the cloud. The
        permissions of the FILENAME will also be changed. A y/n question
        will be asked if the file with the FILENAME should be deleted
        after integration. This helps that all credential information
        could be managed with the cloudmesh.yaml file.

    Arguments:
        FILENAME    a filename in which the cloud credentials are stored
        ATTRIBUTES  Attribute list to replace if json file is not
                    provided. Attributes will override the values from
                    file if both are used.
        SERVICE     service type e.g: compute, storage, volume etc.
        KIND        kind that needs to be registered. E.g: aws, google,
                    azure etc.
                    Multiple kind might be supported by same cloud
                    service provider.

    Options:
        --keep               keeps the file with the filename.
        --dryrun             option to just display the formatted sample
                             without updating the cloudmesh.yaml file.
        --filename=FILENAME  json filename containing the details to be
                             replaced.
        --service=SERVICE    service type e.g. storage,cloud,volume etc.
        --name=NAME          name for the registration to use to add,
                             update or remove.
        --kind=KIND          kind that you want to register e.g: google,
                             aws, azure.

    Examples:

        cms register list
            List all services and related kinds that can be registered.

        cms register list --service=cloud
            List the supported kinds for given cloud service type.

        cms register list sample --kind=google --service=cloud
            Display the sample entry google cloud. It also lists all
            attributes that are needed to successfully register for
            the given kind and service.

        cms remove --kind=google --service=cloud --name=mygoogle
            Remove the cloudmesh.yaml for google cloud registered with
            name mygoogle. If name attribute is not provided, the name
            is defaulted to kind i.e. google in this example.

        cms register update --kind=google --service=compute --filename=
            ~/.cloudmesh/security/google-service-account.json
            Add or update the cloudmesh.yaml entry for google
            cloud/compute type with replaceable attributes provided in
            the json file.
            In this example the values for credential filename,
            project_id, and client_email will be changed to respective
            values from google compute sample. We assume you have
            downloaded the service account credentials form google cloud.
