register list sample --service=volume --kind=azure

Configuration for Cloud=azure Service=volume
--------------------------------------------

::

    cloudmesh:
      volume:
        azure:
          cm:
            active: true
            heading: Azure
            host: azure.microsoft.com
            label: Azure
            kind: azure
            version: latest
            service: compute
          default:
            image: Canonical:UbuntuServer:16.04.0-LTS:latest
            size: Basic_A0
            group: default
            storage_account: cmdrive
            network: cmnetwork
            subnet: cmsubnet
            blob_container: vhds
            AZURE_VM_IP_CONFIG: cloudmesh-ip-config
            AZURE_VM_NIC: cloudmesh-nic
            AZURE_VM_DISK_NAME: cloudmesh-os-disk
            AZURE_VM_USER: cloudmesh
            AZURE_VM_PASSWORD: {password}
            AZURE_VM_NAME: cloudmeshVM
          credentials:
             AZURE_TENANT_ID: {tenantid}
             AZURE_SUBSCRIPTION_ID: {subscriptionid}
             AZURE_APPLICATION_ID: {applicationid}
             AZURE_SECRET_KEY: {secretkey}
             AZURE_REGION: eastus


To register this service the following parameter ned to be defined::

    applicationid
    password
    secretkey
    subscriptionid
    tenantid


Timer: 0.0000s Load: 0.0000s (line_strip)
