openstack
=========

.. parsed-literal::

  Usage:
        openstack list [--details]
        openstack [CLOUD] [--details]

  This command does some useful things.

  Arguments:
      CLOUD   name of the cloud

  Description:
      Prints the configuration file specification of openstack clouds
      If details is specified it also prints the secrets, so please do
      use it carefully

      openstack list [--details]
      openstack [CLOUD]

      NOTE: this command will be replaced with

      cms config list --kind=openstack --details
      cms config CLOUD --details

      The command is temporarily introduced for testing purposes
