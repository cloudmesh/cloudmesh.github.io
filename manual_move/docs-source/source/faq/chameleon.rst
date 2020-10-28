FAQ - Chameleon cloud
=====================

.. warning:: **Disclaimer:** Unfortunately, Chameleon cloud had between
   January 2020 - October 2020 significant issues that required us to
   put this FAQ together. We were told by Chamelon Cloud that the
   issues are supposed to be removed, but we will keep this FAQ for a
   while longer here just in case it is not the case.

   Furthermore, due to our extensive debugging of their fault
   authentication, Chameleon will be providing soon new mechanisms for
   authentication. We have not tested them at this time but hope that
   they will work without change. As we use vanilla OpenStack, it would
   be a disappointment if Chamelon cloud would change the
   authentication mechanisms.

All FAQ’s related to chameleon cloud assume

1. you have looked at the instances with horizon before you use ``cms``
2. ``cms`` is installed
3. ``cms init`` worked and

Cloudmesh is trivial to install.

How check if chmaeleon cloud works
----------------------------------

.. code:: bash

   cms set cloud=chameleon
   cms flavor list --refresh

This returns the list of flavors

How do I upload my key to chameleon?
------------------------------------

.. code:: bash

   cms key upload --cloud=chameleon
   cms key list --cloud=chameleon

What is the error …?
--------------------

1. If you get this error

   ::

      UnboundLocalError: local variable 'key' referenced before assignment

   then you have not upload your key to chameleon

What is the chameleon account bug?
----------------------------------

Preriquisite:

1. We assume you start by deleting your .cloudmesh directory and have
   install a proper version of cms.

2. Before you do anything verify if you can remember your password. You
   must logout of the chameleon cloud.org dashboard and login, while not
   using an auto completion Web password completer. Make sure to remove
   your password if you use one of them.

Chameleon has several strange bugs we know of that will hopefully be
fixed

1. Any account in chameleon that wants to use OpenStack KVM **must**
   first visit horizon and through the visit activate the account. The
   activation via the e-mail that they send to you does not fully
   activate your account.

2. When activation your account in horizon, you must login to a login
   screen. However, sometimes we observed that screen do not complete
   the activation and you do not get forwarded to horizon. Instead you
   end in an endless loop for activation requests.

3. Some students despite the issue of being able to login reported that
   they can not use cms even though they typed in the password
   correctly. To find this out you have to talk to Gregor which
   unfortunately needs your username and password. to verify if your
   account works or not.

4. If Gregor can verify that your account works (e.g. he does this on a
   computer on which we checked chameleon cloud works for another
   account), you will have to apply for a new chameleon account with an
   e-mal that has not been used at

   -  University of Chicago
   -  Indiana University
   -  jetstream
   -  XSEDE
   -  Chameleon Cloud

   Than you do the previous steps and check if you can use this account
   in cms. If it works fine, if it does not file a ticket with chameleon
   cloud.

Gregor completely hats to do 3. and 4. but chameleon cloud have not
provided any proper solutions.

You must not use IUGuest network
--------------------------------

IU GUEST or any other insecure network:

If you are at IU, chameleon cloud does not allow you to connect to it
from IU guest. So if you say cms vm list –refresh and it hangs there for
a long time you will at one point see “Failed to discover available
identity versions when contacting
https://kvm.tacc.chameleoncloud.org:5000/v3. Attempting to parse version
from URL.”

This indicates you can not connect to chamelon cloud as you are on an
insecure network. You can do a CRTL C here

If you wait longer, you will see

::

   keystoneauth1.exceptions.connection.ConnectFailure: Unable to establish
   connection to https://kvm.tacc.chameleoncloud.org:5000/v3/auth/tokens:
   HTTPSConnectionPool(host='kvm.tacc.chameleoncloud.org', port=5000): Max retries
   exceeded with url: /v3/auth/tokens (Caused by
   NewConnectionError(' \< urllib3.connection.VerifiedHTTPSConnection object at
   0x7f63fc14a040 \> : Failed to establish a new connection: [Errno 110] Connection
   timed out'))

Tethering you computer through a cell phone
-------------------------------------------

This will likely not work as your cell phone company has likely some
restrictions.

Can I keep my instance running when not in use?
-----------------------------------------------

No you shout terminate and restart it. However if you initially have
issues keep it running and find in the manual how to suspend and resume
it. You can also do this from horizon if you prefer.

What is ``WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!``
------------------------------------------------------------

This is happening when a previously used ip address is used on another vm
You need to remove the ip from ~/.ssh/kown hosts by using

ssh-keygen -R IPADDRESS

where IPADDRESS is the address to be removed, and than try again

ssh-keygen vs putty
-------------------

use ssh-keygen as it is far easier.

Can I give my own network when booting
--------------------------------------

Yes

::

   cms vm boot --name=gregor-02 \
               --image=CC-Ubuntu18.04 \
               --network=e01ee12e-fd22-4b21-a050-d3e015f42bb1

How do I upload the secgroups
-----------------------------

::

   cms sec group load --cloud=chameleon

Are there additional Videos
---------------------------

Starting vms in horizon
~~~~~~~~~~~~~~~~~~~~~~~

A video was shot by Rahul. I do recommend however if you can just to
keep the keyname on your computer to be id_rsa.

In horizon you naturally use a keyname such as rahul-222 (e.g. what
rahul used)

The reason is that in the future we use cloudmesh and we have a default
key for cloudmesh set as ``id_rsa``. This simplifies debugging in case
something does not go right

-  https://www.youtube.com/watch?v=-2RgDrhN02Q

Starting VMs in cloudmesh
~~~~~~~~~~~~~~~~~~~~~~~~~

Rahul has done a video to show how to start vms in cloudmesh Also we
added the network id to the cloudmesh.yaml file, so if you have a new
version its no longer needed to add the network

-  https://www.youtube.com/watch?v=bDue67M1xl0
