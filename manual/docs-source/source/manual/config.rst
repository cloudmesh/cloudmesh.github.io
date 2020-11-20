config
======

.. parsed-literal::

   Usage:
     config  -h | --help
     config cat [less]
     config check
     config edit [ATTRIBUTE]
     config set ATTRIBUTE=VALUE
     config get ATTRIBUTE [--output=OUTPUT]
     config value ATTRIBUTE
     config cloud verify NAME [KIND]
     config cloud edit [NAME] [KIND]
     config cloud list NAME [KIND] [--secrets]
     config security add (--secret=REGEXP | --exception=REGEXP )
     config security rmv (--secret=REGEXP | --exception=REGEXP )
     config security list


   Arguments:
     ATTRIBUTE=VALUE  sets the attribute with . notation in the
                      configuration file.
     ATTRIBUTE        reads the attribute from the container and sets it
                      in the configuration file
                      If the attribute is a password, * is written instead
                      of the character included
     REGEXP           python regular expression

   Options:
      --name=KEYNAME        The name of a key
      --nopass              Indicates if private key is password protected
      --output=OUTPUT       The output format [default: yaml]

   Description:

     config check
        checks if the ssh key ~/.ssh/id_rsa has a password. Verifies it
        through entering the passphrase

     Key generation

        Keys can be generated with 

            cms key gen (ssh | pem) 

        Key validity and password can be verified with

            cms key verify (ssh | pem) 

        key verify (ssh | pem) [--filename=FILENAME] [--pub]

        ssh-add

     Setting configuration


        config set ATTRIBUTE=VALUE

            config set profile.name=Gregor

        In case the ATTRIBUTE is the name of a cloud defined under
        cloudmesh.cloud, the value will be written into the credentials
        attributes for that cloud this way you can safe a lot of
        typing. An example is

            cms config set aws.AWS_TEST=Gregor

        which would write the AWS_TEST attribute in the credentials
        of the cloud aws. This can naturally be used to set for
        example username and password.
