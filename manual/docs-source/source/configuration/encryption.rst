Cloudmesh Config File Encryption
================================

.. warning:: THIS SECTION IS UNDER DEVELOPMENT

.. todo:: Ensure compatible with Windows

.. todo:: Implement capabilities to query for value of encrypted attribute

Background
~~~~~~~~~~

The cloudmesh.yaml configuration file stores passwords and other secrets
to simplify accessing machines. By default **none** of the passwords are
encrypted. Encryption allows you to store your secrets within the file
and prevents the accidental exposure of your secrets (if you edit your
config while sharing a screen) and makes it harder for malicious users
to steal your passwords. This is all done through the
``cms config encrypt`` and ``cms config decrypt`` commands.

Quick-Start
~~~~~~~~~~~

This guide assumes you are running an Gnu/Linux or macOS machine.

Assuming you do not have cloudmesh installed run the following

.. code:: bash

    $ mkdir cm
    $ cd cm
    $ pip install cloudmesh-installer
    $ cloudmesh-installer git clone cloud
    $ cloudmesh-installer install cloud
    $ cms help

To initialize cloudmesh security run

.. code:: bash

    $ cms config secinit

**If you have already generated an RSA key pair, skip the next command**

Assuming you **have not** previously generated an RSA public-private key pair
(This could have been generated with an ``openssl`` or ``ssh-keygen`` command)
you can generate a private key located at ``~/.ssh/id_rsa`` and public key
located at ``~/.ssh/id_rsa.pub`` by running the following.

.. code:: bash

    $ cms key gen pem

Assuming you have an RSA private-public key pair located at ``~/.ssh/id_rsa`` and
``~/.ssh/id_rsa.pub`` **with PEM or SSH encoding** you can encrypt the default
cloudmesh secrets by executing the following

.. code:: bash

    $ cms config encrypt

When you want to decrypt the configuration secrets run

.. code:: bash

    $ cms config decrypt

Installation
~~~~~~~~~~~~

You must be sure that cloudmesh is installed. The easiest way to install
cloudmesh is via pip. However, it is not yet released with the security
extensions we discuss next. If you would like to use them you need to install
cloudmesh-cloud from source. Which is discussed in the `cloudmesh manual <https://cloudmesh.github.io/cloudmesh-manual/installation/install.html>`_.

To remind you how easy it is you can use the following steps.

.. code:: bash

    $ mkdir cm
    $ cd cm
    $ pip install cloudmesh-installer
    $ cloudmesh-installer git clone cloud
    $ cloudmesh-installer install cloud
    $ cms help

Please remember that after this you should configure your
``~/.cloudmesh/cloudmesh.yaml`` configuration file.

Preparation
~~~~~~~~~~~

After the system has been installed cloudmesh will need to initialize its
security capabilities. If you wish to control where it is initialized
reference the `Changing the secinit Directory`_ section.
Otherwise, initialize the configuration capabilities by running the the
following.

.. code:: bash

        $ cms config secinit

Now that we have the proper system related properties initialized we need
an RSA public-private key pair to execute encryption and decryption of
the data. The public key is used to encrypt data and the private key is
used to decrypt. **If you have previously generated an RSA key pair** please
reference the `Setting Keys for Encryption Without Key Gen Command`_
section. Otherwise, run the following to generate a key pair.

.. code:: bash

        $ cms key gen pem

Now that we ran secinit and obtained an RSA key pair we can encrypt the config.

Encrypting the Config File
~~~~~~~~~~~~~~~~~~~~~~~~~~

Cloudmesh encrypts some attributes by default. To reference which values
will be encrypted run the ``cms config security list`` command. This will
print all of the attribute dot paths whoes values will be encrypted by the
`cms config encrypt` command.

Cloudmesh provides functionality to add or remove which attributes are encrypted.
To add attributes that will be encrypted reference the
`Selecting Attributes to Encrypt`_ section. To ensure certain attributes are
**not encrypted** reference the `Selecting Attributes to Exclude from Encryption`_

After referencing the ``cms config security list`` command and ensuring that the
list meets your needs you can encrypt the config file by running the following.

.. code:: bash

        $ cms config encrypt

After this command is completed all of the explicitly defined secrets
are encrypted at rest. This means that even if the data is exposed the
data should be secured by typical definitions of security. This also
means that any other cloudmesh command that references an encrypted
attribute will return an encrypted value. Thus, care should be taken to
not call commands that require encrypted attributes. To reference the
original values you must decrypt the config file.

Decrypting the Config File
~~~~~~~~~~~~~~~~~~~~~~~~~~

The configuration file can be decrypted by running the following
command.

.. code:: bash

        $ cms config decrypt

If the private key was password protected you must enter the password
when prompted. If the key has no password either hit enter immediately
after being prompted or run the following.

.. code:: bash

        $ cms config decrypt --nopass

.. _`Additional Configuration Options`:

Additional Configuration Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _`Changing the secinit Directory`:

Changing the secinit Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The secinit directory controls where encryption related data is stored.
The default location is ~/.cloudmesh/security. If you wish to change
this location you must edit the ``cloudmesh.security.secpath``
attribute. For example, if you wish that cloudmesh secrets are stored
within ``~/.cloudmesh/.foosec`` run the following

.. code:: bash

        $ cms config set cloudmesh.security.secpath=~/.cloudmesh/.foosec
        $ cms config secinit

CMS Key Gen Options
^^^^^^^^^^^^^^^^^^^

Setting Non-Default Names for Key Generation
''''''''''''''''''''''''''''''''''''''''''''

The ``cms key gen`` command will automatically generate the key pair
into the default locations of ``~/.ssh/id_rsa`` and
``~/.ssh/id_rsa.pub``. If this key already exists or if you prefer a
different location use the ``--filename=FILENAME`` argument. Where the FILENAME
is the full file path to the key you would like to generate. For example, if we
would like to have a private key called ``cms`` and public key called ``cms.pub`` 
in the .ssh directory execute the following.

.. code:: bash

        $ cms key gen rsa --filename=~/.ssh/cms

.. _`Setting Keys for Encryption Without Key Gen Command`:

Setting Keys for Encryption Without Key Gen Command
'''''''''''''''''''''''''''''''''''''''''''''''''''

The path to the encryption and decryption keys are located in
``cloudmesh.security.pubickey`` and ``cloudmesh.security.privatekey``
respectively. When keys are generated with the ``--set_path`` argument
they set these attributes after the keys are generated.

If you already have RSA keys that are PEM or OpenSSH encoded you can set the
path directly. For instance let us assume we already had ``~/.ssh/priv/cms``
and its public key pair ``~/.ssh/pub/cms.pub``. We can set Cloudmesh to use
these keys for encryption by running the following.

.. code:: bash

        $ cms config set cloudmesh.security.privatekey=~/.ssh/priv/cms
        $ cms config set cloudmesh.security.publickey=~/.ssh/pub/cms.pub

Generating a Key Without a Password
'''''''''''''''''''''''''''''''''''

Passwords for your RSA private key are recommended. It is much easier to
**lose all security guarantees** if you private key is not encrypted.
Unless you have a good reason, keep a password on your private file. If
you understand this and still wish to generate a key without a password
run

.. code:: bash

        $ cms key gen pem --nopass

.. _`Selecting Attributes to Encrypt`:

Selecting Attributes to Encrypt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Internally, Cloudmesh represents all values as the yaml dot path to the
attribute. The ``cloudmesh.security.secrets`` attribute takes a list
of python regular expressions that will be matched on the dot paths to
the attributes to decide which attributes will be encrypted.

To learn the specifics about python regular expression please reference
the `python re documentation <https://docs.python.org/3.8/library/re.html>`_.

loudmesh encrypts some values by default. To reference which values
will be encrypted run the ``cms config security list`` command. This will
print all of the attribute dot paths that will be encrypted by the
``cms config encrypt`` command.

If you wish to add you own regular expression to encrypt attributes run
the ``cms config security add --secret=REGEXP`` command. Where REGEXP is a
python regular expression. For instance, if you wish to encrypt all
``AZURE_SECRET_KEY`` attributes you can execute the following.

.. code:: bash

        $ cms config security add --secret=.*AZURE_SECRET_KEY

If you wish to encrypt a specific attribute you can provide the dot
path. For instance, to encrypt the mongo database ``MONGO_PASSWORD``

.. code:: bash

        $ cms config security add --secret=cloudmesh.data.mongo.MONGO_PASSWORD

Expressions added by the user can be referenced within the
``cloudmesh.security.secrets`` attribute. If you wish to remove any regular
expressions from the secrets section run the ``cms config security rmv`` command
For instance, to remove the previously added attribute run the following.

.. code:: bash

        $ cms config security rmv --secret=cloudmesh.data.mongo.MONGO_PASSWORD

.. _`Selecting Attributes to Exclude from Encryption`:

Selecting Attributes to Exclude from Encryption
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``cloudmesh.security.exception`` section is intended to list attributes
that must **not** be encrypted. This section also explicitly uses python regular
expressions to capture the attribute dot paths. Cloudmesh has some attributes
that will not be encrypted, these attributes are necessary for the decryption of
data. You can add your own regular expressions to capture which attributes will
not be encrypted with the ``cms config security add --exception=REGEXP`` command

For instance, if you wish to ensure that none of the
``AZURE_SECRET_KEY`` attributes are encrypted run the following.

.. code:: bash

        $ cms config security add --exception=.*AZURE_SECRET_KEY

If you wish to exclude a specific attribute give the dot path.

.. code:: bash

        $ cms config security add --exception=cloudmesh.data.mongo.MDB_PASSWORD

If you wish to remove any regular expressions within the exceptions
section run the ``cms config security rmv`` command. For instance to
remove the example exceptions.

.. code:: bash

        $ cms config security rmv --exception=.*AZURE_SECRET_KEY
        $ cms config security rmv --exception=cloudmesh.data.mongo.MDB_PASSWORD

You can verify the addition or removal of the rule by observing the results
of the ``cms config security list`` command and confirming that the dot path
to the attribute you do not want to encrypt is not listed.

.. note::
    The exceptions section has priority over the secrets section.
    If there is ever an attribute that is matched on both secrets and
    exceptions regular expressions the attribute will **not** be encrypted.
