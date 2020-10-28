AWS EC2 VM Management
---------------------

Benchmark results for AWS EC2 File vm management under
cloudmesh-storage.

::

    PING ms : 19
    DOWNLOAD Mbps : 54.05
    UPLOAD Mbps : 5.90

::

   +------------------+--------------------------------------------------------------------------------------------------+
   | Machine Arribute | Time/s                                                                                           |
   +------------------+--------------------------------------------------------------------------------------------------+
   | mac_version      | 10.14.2                                                                                          |
   | machine          | ('x86_64',)                                                                                      |
   | node             | ('hyspocMacBookPro.local',)                                                                      |
   | platform         | Darwin-18.2.0-x86_64-i386-64bit                                                                  |
   | processor        | ('i386',)                                                                                        |
   | processors       | Darwin                                                                                           |
   | python           | 3.7.2 (default, Feb  8 2019, 11:44:32)                                                           |
   |                  | [Clang 10.0.0 (clang-1000.11.45.5)]                                                              |
   | release          | ('18.2.0',)                                                                                      |
   | sys              | darwin                                                                                           |
   | system           | Darwin                                                                                           |
   | user             | hyspoc                                                                                            |
   | version          | Darwin Kernel Version 18.2.0: Mon Nov 12 20:24:46 PST 2018; root:xnu-4903.231.4~2/RELEASE_X86_64 |
   | win_version      |                                                                                                  |
   +------------------+--------------------------------------------------------------------------------------------------+
   +-------------------------+------+-----------------------------+--------+-------------+-------------+
   | timer                   | time | node                        | system | mac_version | win_version |
   +-------------------------+------+-----------------------------+--------+-------------+-------------+
   | cms vm boot dryrun      | 1.88 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm boot             | 4.28 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm list             | 4.24 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm status           | 1.82 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm stop dryrun      | 1.83 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm stop             | 2.88 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm ping             | 3.84 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm check            | 3.32 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm run dryrun       | 1.83 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm script dryrun    | 1.82 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm start dryrun     | 1.82 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm start            | 2.82 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm delete dryrun    | 1.84 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm terminate dryrun | 1.82 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm terminate        | 2.31 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   | cms vm delete           | 2.31 | ('hyspocMacBookPro.local',) | Darwin | 10.14.2     |             |
   +-------------------------+------+-----------------------------+--------+-------------+-------------+
