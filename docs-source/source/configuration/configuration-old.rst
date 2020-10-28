zure
~~~~~

.. todo:: az arm provider this has to be verified. We will likely
          deprecate this for a more elaborate provider

To obtain an account on Azure you can follow our instructions at

:doc:`../accounts/azure`. The configuration file containes the following::


   cloudmesh:
     ...
     cloud:
       ...
       azure:
         cm:
           active: False
           heading: Azure
           host: azure.microsoft.com
           label: Azure
           kind: azure
           version: TBD
           service: compute
         default:
           image: 'Canonical:UbuntuServer:16.04-LTS:latest'
           size: 'Basic_A0'
           resource_group: 'cloudmesh'
           storage_account: 'cmdrive'
           network: 'cmnetwork'
           subnet: 'cmsubnet'
           blob_container: 'vhds'
         credentials:
           AZURE_TENANT_ID: 'xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
           AZURE_SUBSCRIPTION_ID: 'xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
           AZURE_APPLICATION_ID: 'xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
           AZURE_SECRET_KEY: TBD
           AZURE_REGION: 'northcentralus'

OpenStack
~~~~~~~~~

We provide an example of how to use an OpenStack based cloud in
Cloudmesh. Please, place the following to your ``cloudmesh.yaml`` file
and replace the values for ``TBD``. Our example uses `Chameleon Cloud
<https://www.chameleoncloud.org/>`__. This is a cloud for academic
research. Certainly, you can configure other clouds based on this
template. We have successfully used also clouds in Canada (Cybera),
Germany (KIT), Indiana University (jetstream). TO get started, you can
even install your local cloud with devstack and make adjustments.
Please remember you can have multiple clouds in the
``cloudmesh.yaml`` file so you could if you have access to them
integrate all of them.  You will need access to a project and add your
project number to. the credentials.  Example for chameleon cloud::

   cloudmesh:
     ...
     cloud:
       ...
       chameleon:
         cm:
           active: True
           heading: Chameleon
           host: chameleoncloud.org
           label: chameleon
           kind: openstack
           version: liberty
           service: compute
         credentials:
           OS_AUTH_URL: https://openstack.tacc.chameleoncloud.org:5000/v2.0
           OS_USERNAME: TBD
           OS_PASSWORD: TBD
           OS_TENANT_NAME: CH-819337
           OS_TENANT_ID: CH-819337
           OS_PROJECT_NAME: CH-819337
           OS_PROJECT_DOMAIN_ID: default
           OS_USER_DOMAIN_ID: default
           OS_VERSION: liberty
           OS_REGION_NAME: RegionOne
           OS_KEY_PATH: ~/.ssh/id_rsa.pub
         default:
           flavor: m1.small
           image: CC-Ubuntu16.04
           username: cc


Virtual Box
~~~~~~~~~~~

Virtualbox has at this time-limited functionality, but creation, ssh,
and the deletion of the virtual box is possible.

You can also integrate virtualbox as part of cloudmesh while providing
the following description::

   cloudmesh:
     ...
     cloud:
       ...
       vbox:
         cm:
           active: False
           heading: Vagrant
           host: localhost
           label: vbox
           kind: vagrant
           version: TBD
           service: compute
         default:
           path: ~/.cloudmesh/vagrant
           image: "generic/ubuntu1810"
         credentials:
           local: True
           hostname: localhost

Storage Providers
-----------------

General description for all storage providers, comment on the
``default:`` and what that does

AWS S3
~~~~~~

It is beyond the scope of this manual to discuss how to get an account
on Google. However, we do provide a convenient documentation at
:doc:`../accounts/aws`.


In the ``cloudmesh.yaml`` file, the ‘aws’ section under ‘storage’
describes an example configuration or a AWS S3 storage provider. In
the credentials section under aws, specify the access key id and
secret access key which is available in the AWS console under AWS
IAM ``service`` -> ``Users`` -> ``Security Credentials``. Container is
the default Bucket which is used to store the files in AWS
S3. The region is the geographic area like ``us-east-1`` which contains
the bucket.  The region is required to get a connection handle on the S3
Client or resource for that geographic area. Here is a sample::

   cloudmesh:
     ...
     storage:
       aws:
         cm:
           heading: aws
           host: amazon.aws.com
           label: aws
           kind: awsS3
           version: TBD
           service: storage
         default:
           directory: /
         credentials:
           access_key_id: *********
           secret_access_key: *******
           container: name of bucket that you want user to be contained in.
           region: us-east-1

.. todo:: Make credentials more uniform between compute and data


.. todo:: in azure we had these explanations, maybe we need more info
	  in the sample


	  Configuration settings for credentials in the yaml file can be
	  obtained from Azure portal.

	  TODO: More information via a pointer to a documentation you create needs
	  to be added here

	  In the YAML file the following values have to be changed

	  -  ``account_name`` - This is the name of the Azure blob storage
	     account.
	  -  ``account_key`` - This can be found under ‘Access Keys’ after
	     navigating to the storage account on the Azure portal.
	  -  ``container`` - This can be set to a default container created under
	     the Azure blob storage account.


Google drive
~~~~~~~~~~~~

.. todo:: to be deleted once integrated in table

Due to bugs in the requirements of the google driver code, we have not
yet included it in the Provider code. This needs to be fixed before we
can do this.

It is beyond the scope of this manual to discuss how to get an account
on Google. However, we do provide a convenient documentation at
.

The ``cloudmesh.yaml`` file needs to be set up as follows for the
‘gdrive’ section under ‘storage’::

   cloudmesh:
     ...
     storge:
       gdrive:
         cm:
           heading: GDrive
           host: gdrive.google.com
           kind: gdrive
           label: GDrive
           version: TBD
           service: storage
         credentials:
           auth_host_name: localhost
           auth_host_port:
             - ****
             - ****
           auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs"
           auth_uri: "https://accounts.google.com/o/oauth2/auth"
           client_id: *******************
           client_secret: ************
           project_id: ************
           redirect_uris:
             - "urn:ietf:wg:oauth:2.0:oob"
             - "http://localhost"
           token_uri: "https://oauth2.googleapis.com/token"
         default:
           directory: TBD

Google Cloud Storage
~~~~~~~~~~~~~~~~~~~~

::

    cloudmesh:
      ...

      storage:
        ...
        google:
          cm:
            name: google
            active: 'true'
            heading: GCP
            host: https://console.cloud.google.com/storage
            kind: google
            version: TBD
            service: storage
          default:
            directory: cloudmesh_gcp
            Location_type: Region
            Location: us - east1
            Default_storage_class: Standard
            Access_control: Uniform
            Encryption: Google-managed
            Link_URL: https://console.cloud.google.com/storage/browser/cloudmesh_gcp
            Link_for_gsutil: gs://cloudmesh_gcp
          credentials:
            type: service_account
            project_id: imposing-coast-123456
            private_key_id: a1b2c3d4*********
            private_key: '-----BEGIN PRIVATE KEY-----

              ***********************************************************
              ***********************************************************
              ...
              ***********************************************************

              -----END PRIVATE KEY-----

              '
            client_email: user@imposing-coast-123456.iam.gserviceaccount.com
            client_id: '1234567******23456'
            auth_uri: https://accounts.google.com/o/oauth2/auth
            token_uri: https://oauth2.googleapis.com/token
            auth_provider_x509_cert_url: https://www.googleapis.com/oauth2/v1/certs
            client_x509_cert_url: https://www.googleapis.com/robot/v1/metadata/x509/user%40imposing-coast-12345.iam.gserviceaccount.com


Box
~~~

It is beyond the scope of this manual to discuss how to get an account
on Google. However, we do provide a convenient documentation at
:doc:`../accounts/box`.


In the ``cloudmesh.yaml`` file, find the ‘box’ section under ‘storage’.
Under credentials, set ``config_path`` to the path of the configuration
file you created as described in the Box chapter::

   cloudmesh:
     ...
     box:
       cm:
         heading: Box
         host: box.com
         label: Box
         kind: box
         version: TBD
         service: storage
       default:
         directory: /
       credentials:
         config_path: ******************************


Log File
--------

.. note::  Previous versions of cloudmesh had a sophisticated logging feature.
           This version has this feature not yet made available. Implement it
           and make available. At this time, it is not our highest priority.

Log files are stored by default in ``~/.cloudmesh/log`` The directory
can be specified in the yaml file.

