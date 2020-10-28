Google Cloud Account
====================

Google Cloud account is required to configure and use compute, storage
and volume services from cloudmesh-google provider. This page will detail
steps to create a Google Cloud account and register it with cloudmesh.

Prerequisites
-------------

We assume you have the cloudmesh google provider installed. This can be
done with

.. code:: bash

   $ pip install cloudmesh-google

For developers the best way to install it is to use
``cloudmesh-installer``.

.. code:: bash

   $ mkdir cm
   $ cd cm
   $ pip install cloudmesh-installer
   $ cloudmesh-installer get google

.. mermaid::

    graph LR
      prereq(Prequisite)-->choose{Choose};

      choose-->|Developer|a(mkdir cm  <br> cd cm  <br> pip install cloudmesh-installer  <br> cloudmesh-installer get google)
      choose-->|Production|p(pip install cloudmesh-google)

Creating the Google Account
---------------------------

If you do not have a google cloud account a
new google account can be created using following link:

-  `Create your Google
   Account <https://accounts.google.com/signup/v2/webcreateaccount?flowEntry=SignUp&flowName=GlifWebSignIn>`__

Activation Google Cloud Service
-------------------------------

Google allows you to apply for an free account and offers you $300 in credits
to use google cloud. After creating a new account apply for free trail and $300
credit at:

-  `Get Started for
   Free <https://console.cloud.google.com/freetrial?_ga=2.36435558.-733144975.1575249772&_gac=1.216762084.1575249889.CjwKCAiA5o3vBRBUEiwA9PVzavyytvYEKObpJV-GtriRXXj9JCtqPkm3TEpyZ6pDgOHWgDXuqZ7tFBoCjacQAvD_BwE>`__

For students or education account, apply at:

-  `Google for
   Education <https://edu.google.com/products/google-cloud-platform/?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-b-dr-1007179&utm_content=text-ad-none-any-DEV_c-CRE_182323152622-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20SKWS%20%7C%20US%20%7C%20en%20%7C%20Multi%20~%20Student-KWID_43700018304461092-kwd-285517564251&utm_term=KW_%2Bstudent%20%2Bcloud-ST_%2BStudent%20%2BCloud&gclid=EAIaIQobChMI07zC9eeV5gIVhMBkCh2yMwA2EAAYASAAEgKmHfD_BwE&modal_active=none>`__

Please choose the one that is most appropriate for you. For the
educational account you may need a verification from your school or an
email that is registered as an educational institution.

Setting up Google Cloud Account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Next, you will need to create a project and a service account.
All service calls from cloudmesh require a project id to
create VM, Disks, Volumes etc.

We recommend that you simply use project name ``cloudmesh``.

To authenticate the google cloud API from cloudmesh
you also need to enable the required API and
create a service account and then download the service
account key.

Steps to setup project and service account:

.. mermaid::

    graph TD
      account(Google Cloud Account)-->choose{Already have GCP Account?};

      choose-->|Create|createa(Create Google Cloud Account)
      choose-->|Signin|signin(Login to Google Cloud Console)

      createa-->choosea{Choose Account Type}

      choosea-->free(Sign Up for Free Tier)
      choosea-->edu(Sign Up for Education Account)

      free-->|Signin|signin
      edu-->|Signin|signin

      signin-->project(Create Project <br> name cloudmesh)
      project-->enableapi(Enable API e.g. <br> Compute, Storage, Volume)
      enableapi-->createsa(Create/Select Service Account)
      createsa-->downloadsk("Create/Download Service Key <br> name google.json <br> to folder ~/.cloudmesh/security")
      downloadsk-->register("Register to Cloudmesh <br> with downloaded json")

      click createa "https://accounts.google.com/signup/v2/webcreateaccount?flowEntry=SignUp&flowName=GlifWebSignIn"
      click signin "http://console.cloud.google.com/"
      click free "https://console.cloud.google.com/freetrial?_ga=2.36435558.-733144975.1575249772&_gac=1.216762084.1575249889.CjwKCAiA5o3vBRBUEiwA9PVzavyytvYEKObpJV-GtriRXXj9JCtqPkm3TEpyZ6pDgOHWgDXuqZ7tFBoCjacQAvD_BwE"
      click edu "https://edu.google.com/products/google-cloud-platform/?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-b-dr-1007179&utm_content=text-ad-none-any-DEV_c-CRE_182323152622-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20SKWS%20%7C%20US%20%7C%20en%20%7C%20Multi%20~%20Student-KWID_43700018304461092-kwd-285517564251&utm_term=KW_%2Bstudent%20%2Bcloud-ST_%2BStudent%20%2BCloud&gclid=EAIaIQobChMI07zC9eeV5gIVhMBkCh2yMwA2EAAYASAAEgKmHfD_BwE&modal_active=none"
      click project "https://console.cloud.google.com/projectcreate"
      click enableapi "https://console.cloud.google.com/apis/library"
      click createsa "https://console.cloud.google.com/projectselector2/iam-admin/serviceaccounts?supportedpurview=project"
      click downloadsk "https://console.cloud.google.com/apis/credentials/serviceaccountkey"
      click register "https://cloudmesh.github.io/cloudmesh-manual/manual/register.html"

.. list-table:: Google account creation steps
   :widths: 5 35 60
   :header-rows: 1

   * - Step
     - Description
     - Screenshot
   * - 1
     - `Create Project <https://console.cloud.google.com/projectcreate>`__
     - |google-account-1|
   * - 2
     - Next `Enable API <https://console.cloud.google.com/apis/library>`__
     - |google-account-4|
   * - 3
     - | For E.g.
       | `Enable Compute API <https://console.cloud.google.com/apis/library/compute.googleapis.com?q=Compute>`__
     - |google-account-5|
   * - 4
     - | Next `Select Service Account <https://console.cloud.google.com/projectselector2/iam-admin/serviceaccounts?supportedpurview=project>`__
       | to create and download
       | service account key.
     -
   * - 5
     - | `Create Service Account Key <https://console.cloud.google.com/apis/credentials/serviceaccountkey>`__.
       | Download the service
       | account key file to
       | ``~/.cloudmesh/security``
       | folder with name
       | ``google.json``.
     - |google-account-2|

After the key is downloaded, make sure you keep the ``~/.cloudmesh``
directory secure.

We will use the downloaded json file to register google cloud with
cloudmesh and enable cloudmesh to invoke google cloud API
by updating YAML entry in file

``$ ~/.cloudmesh/cloudmesh.yaml``

Next register google cloud account with cloudmesh.

Registering Google Cloud to Cloudmesh
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Use the following command to register google cloud
with cloudmesh. This command will update the
``cloudmesh.yaml`` file for respective service.

Register Google Compute
~~~~~~~~~~~~~~~~~~~~~~~

::

   $ cms register update --kind=google --service=compute --filename=~/.cloudmesh/security/google.json

Register Google Storage
~~~~~~~~~~~~~~~~~~~~~~~

::

   $ cms register update --kind=google --service=Storage --filename=~/.cloudmesh/security/google.json bucket=cloudmesh-bucket

Note: The cloudmesh-bucket will be used as default storage bucket.

Register Google Volume
~~~~~~~~~~~~~~~~~~~~~~

::

   $ cms register update --service=volume --kind=google --filename=~/.cloudmesh/security/google.json zone=us-west-a sizeGb=100 label=google

Verify Setup
^^^^^^^^^^^^

Check the setup by running the following command

.. code:: bash

   $ cms set cloud=google
   $ cms vm list --refresh

The above command should list the VMs from your google cloud compute service.

You are all set with Google Cloud account setup.

Links
-----

-  `New Google Cloud Account
   Introduction <https://console.cloud.google.com/getting-started>`__
-  `Create a Google Cloud Account- Free
   Tier <https://cloud.google.com/free/docs/gcp-free-tier>`__
-  `Authentication Overview \| Authentication \| Google
   Cloud <https://cloud.google.com/docs/authentication/>`__
-  `Understanding service accounts \| Google
   Cloud <https://cloud.google.com/iam/docs/understanding-service-accounts/>`__

.. |google-account-1| thumbnail:: images/MyAccount_03.png
.. |google-account-2| thumbnail:: images/CreateKey_01.png
.. |google-account-3| thumbnail:: images/MyAccount_03.png
.. |google-account-4| thumbnail:: images/EnableAPI_01.png
.. |google-account-5| thumbnail:: images/EnableAPI_02.png
