Box Account
===========

Box provides a cloud file sharing service for businesses. Clients exists
for Windows, MacOS, and Linux. To obtain an account you have to first
visit the box home page as

-  https://www.box.com/home

Sign up
-------

.. container:: clearfix

    .. thumbnail:: images/box/get_started.png
       :align: right
       :width: 30%

   **Create an Account**: To sign up for the account, click on the top right
   hand corner of the
   box `homepage <https://www.box.com/home>`__ on the ``Get Started``
   button. You will see the Home page.

.. container:: clearfix

    .. thumbnail:: images/box/individual_plan.png
       :align: right
       :width: 30%

    **Individual Plan**: Select the ``Individual`` tab and then click on the free option.

.. container:: clearfix

   |box-start-3|

   **Verification**: Chose an Individual plan, fill out the
   required information and click ``Submit``.
   You will receive a confirmation email with
   a link to verify your account.

.. container:: clearfix

   |box-start-4|

   **Go to Box**: Once you have verified your account and
   signed in, you will be taken to a page
   that asks you about how you are using Box.
   You may fill this out or click
   ``Skip this and go straight to Box`` below
   the ``Next`` button.

Create an App
-------------

You will see the Home page Navigate to the
`developer console <https://app.box.com/developers/console>`__
and select ``Create New App``. You will need
to select what type of application you are
building and an authentication method for
your app and then enter an app name (you
can change this later). Once your app has
been created, click View App. You will then
need to click the profile button in the top
right corner of the page, and go to
``Account Settings``. Scroll down to the
Authentication section and click
``Require 2-step verification for
unrecognized logins``, then follow the prompts.

Authenticate with JWT
---------------------

.. container:: clearfix

    |box-key|

    In the Configuration panel of the Developer
    Console, scroll down to the section titled
    ``Add and Manage Public Keys`` and click
    ``Generate a Public/Private Keypair``.
    Once you have generated a keypair, a
    ``config.json`` file will automatically
    downloaded. Save this file in a secure
    location as you will need it for
    authentication purposes. We recommend storing
    it at ``~/.cloudmesh/box/config.json``.
    This will avoid that you conflict with
    another file called ``config.json``




References
----------

*  https://developer.box.com/reference


.. |box-start-3| thumbnail:: images/box/information.png
   :align: right
   :width: 30%

.. |box-start-4| thumbnail:: images/box/skip.png
   :align: right
   :width: 30%

.. |box-key| thumbnail:: images/box/box_add_key.png
   :align: right
   :width: 50%

