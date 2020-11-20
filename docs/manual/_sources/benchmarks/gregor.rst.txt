Benchmarks
==========

Systems
-------

Gregor Laptop
~~~~~~~~~~~~~

::

   tests/cloud/test_00_sys.py::Test_Sys::test_benchmark 
   +-------------------+--------------------------------------------------------------------------------------------------+
   | Machine Attribute | Value                                                                                            |
   +-------------------+--------------------------------------------------------------------------------------------------+
   | cpu_count         | 8                                                                                                |
   | mac_version       | 10.14.5                                                                                          |
   | machine           | ('x86_64',)                                                                                      |
   | mem_active        | 6.0 GiB                                                                                          |
   | mem_available     | 6.4 GiB                                                                                          |
   | mem_free          | 470.4 MiB                                                                                        |
   | mem_inactive      | 5.9 GiB                                                                                          |
   | mem_percent       | 59.9%                                                                                            |
   | mem_total         | 16.0 GiB                                                                                         |
   | mem_used          | 8.4 GiB                                                                                          |
   | mem_wired         | 2.4 GiB                                                                                          |
   | node              | ('greg',)                                                                                        |
   | platform          | Darwin-18.6.0-x86_64-i386-64bit                                                                  |
   | processor         | ('i386',)                                                                                        |
   | processors        | Darwin                                                                                           |
   | python            | 3.7.4 (v3.7.4:e09359112e, Jul  8 2019, 14:54:52)                                                 |
   |                   | [Clang 6.0 (clang-600.0.57)]                                                                     |
   | release           | ('18.6.0',)                                                                                      |
   | sys               | darwin                                                                                           |
   | system            | Darwin                                                                                           |
   | user              | greg                                                                                             |
   | version           | Darwin Kernel Version 18.6.0: Thu Apr 25 23:16:27 PDT 2019; root:xnu-4903.261.4~2/RELEASE_X86_64 |
   | win_version       |                                                                                                  |
   +-------------------+--------------------------------------------------------------------------------------------------+
   +----------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | timer                | time | tag       | node      | user | system | mac_version | win_version |
   +----------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | test_cms_help        | 1.85 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | benchmark_start_stop | 0.0  | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   +----------------------+------+-----------+-----------+------+--------+-------------+-------------+

Gregor PC
~~~~~~~~~

TBD

Key
---

OpenStack
~~~~~~~~~

::

   tests/cloud/test_01_key.py::Test_Key::test_benchmark 
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | timer                       | time | tag       | node      | user | system | mac_version | win_version |
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | test_upload_key_to_database | 0.06 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_upload_key_to_cloud    | 0.32 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_list_key_from_cloud    | 0.26 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_delete_key_from_cloud  | 0.27 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | benchmark_start_stop        | 0.0  | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+

Flavor
------

AWS
~~~

Gregors PC
^^^^^^^^^^

This is don on Windows 10 in the 18.04 Ubuntu Linux subsystem with
python 3.7

::

   +-----------------------------+--------+-----+----------------------+------+--------+-------------+-------------+
   | timer                       | time   | tag | node                 | user | system | mac_version | win_version |
   +-----------------------------+--------+-----+----------------------+------+--------+-------------+-------------+
   | test_empty_database         | 0.01   | aws | ('DESKTOP-gregor9',) | blue | Linux  |             |             |
   | test_provider_flavor        | 92.34  | aws | ('DESKTOP-gregor9',) | blue | Linux  |             |             |
   | test_provider_flavor_update | 168.03 | aws | ('DESKTOP-gregor9',) | blue | Linux  |             |             |
   | test_cms_flavor_refresh     | 182.62 | aws | ('DESKTOP-gregor9',) | blue | Linux  |             |             |
   | test_cms_flavor             | 4.8    | aws | ('DESKTOP-gregor9',) | blue | Linux  |             |             |
   | benchmark_start_stop        | 0.0    | aws | ('DESKTOP-gregor9',) | blue | Linux  |             |             |
   +-----------------------------+--------+-----+----------------------+------+--------+-------------+-------------+

Gregor’s macOS Laptop
^^^^^^^^^^^^^^^^^^^^^

::

   +-----------------------------+--------+-----+-----------+------+--------+-------------+-------------+
   | timer                       | time   | tag | node      | user | system | mac_version | win_version |
   +-----------------------------+--------+-----+-----------+------+--------+-------------+-------------+
   | test_empty_database         | 0.02   | aws | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_provider_flavor        | 121.8  | aws | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_provider_flavor_update | 247.81 | aws | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_cms_flavor_refresh     | 259.92 | aws | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_cms_flavor             | 5.5    | aws | ('greg',) | greg | Darwin | 10.14.5     |             |
   | benchmark_start_stop        | 0.0    | aws | ('greg',) | greg | Darwin | 10.14.5     |             |
   +-----------------------------+--------+-----+-----------+------+--------+-------------+-------------+

.. _openstack-1:

Openstack
~~~~~~~~~

.. _gregors-macos-laptop-1:

Gregor’s macOS Laptop
^^^^^^^^^^^^^^^^^^^^^

::

   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | timer                       | time | tag       | node      | user | system | mac_version | win_version |
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | test_empty_database         | 0.01 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_provider_flavor        | 1.36 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_provider_flavor_update | 0.74 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_cms_flavor_refresh     | 3.39 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | test_cms_flavor             | 1.88 | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   | benchmark_start_stop        | 0.0  | chameleon | ('greg',) | greg | Darwin | 10.14.5     |             |
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+

Secgroup
--------

.. _openstack-2:

Openstack
~~~~~~~~~

.. _gregors-macos-laptop-2:

Gregor’s macOS Laptop
^^^^^^^^^^^^^^^^^^^^^

::

   tests/cloud/test_04_sec_command.py::TestSecCLI::test_benchmark 
   +---------------------------+-------+-----------+-----------+------+--------+-------------+-------------+
   | timer                     | time  | tag       | node      | user | system | mac_version | win_version |
   +---------------------------+-------+-----------+-----------+------+--------+-------------+-------------+
   | test_group_add            | 1.85  | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_group_delete         | 1.88  | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_cms_init             | 11.42 | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_sec_list             | 1.88  | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_sec_group_list_local | 1.86  | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_sec_group_list_cloud | 2.9   | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | benchmark_start_stop      | 0.0   | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   +---------------------------+-------+-----------+-----------+------+--------+-------------+-------------+

::

   tests/cloud/test_05_secgroup_provider.py::Test_secgroup_provider::test_benchmark 
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | timer                       | time | tag       | node      | user | system | mac_version | win_version |
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+
   | test_load                   | 0.01 | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_list_variables         | 0.0  | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_list_secgroups_rules   | 1.05 | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_secgroups_delete       | 0.84 | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_secgroups_add          | 0.71 | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | test_secgroups_delete_again | 1.02 | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   | benchmark_start_stop        | 0.0  | chameleon | ('gray',) | grey | Darwin | 10.14.5     |             |
   +-----------------------------+------+-----------+-----------+------+--------+-------------+-------------+
