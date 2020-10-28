AWS S3 File Storage
-------------------

Benchmark results for AWS S3 File storage under cloudmesh-storage.

::

    PING ms : 3
    DOWNLOAD Mbps : 46.86
    UPLOAD Mbps : 35.13

::

   +------------------+----------------------------------------------------+
   | Machine Arribute | Time/s                                             |
   +------------------+----------------------------------------------------+
   | mac_version      |                                                    |
   | machine          | AMD64                                              |
   | node             | DESKTOP-CNS55VM                                    |
   | platform         | Windows-10-10.0.17134-SP0                          |
   | processor        | Intel64 Family 6 Model 78 Stepping 3, GenuineIntel |
   | processors       | Windows                                            |
   | release          | 10                                                 |
   | sys              | win32                                              |
   | system           | Windows                                            |
   | version          | 10.0.17134                                         |
   | win_version      | ('10', '10.0.17134', 'SP0', 'Multiprocessor Free') |
   +------------------+----------------------------------------------------+
   +---------------------------------+-------+-----------------+---------+-------------+------------------------------------------+
   | timer                           | time  | node            | system  | mac_version | win_version                              |
   +---------------------------------+-------+-----------------+---------+-------------+------------------------------------------+
   | PUT file                        | 0.29  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | GET file                        | 0.35  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | LIST Directory                  | 3.52  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | CREATE DIR                      | 0.36  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | SEARCH file                     | 1.08  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | DELETE Directory                | 0.49  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | PUT Directory --recursive       | 32.34 | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | GET Directory --recursive       | 35.97 | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | DELETE Sub-directory            | 0.64  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | LIST Directory --recursive      | 11.55 | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | LIST Sub-directory --recursive  | 1.15  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | SEARCH file --recursive         | 1.63  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | SEARCH file under a sub-dir --r | 0.31  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   | SEARCH file under root dir --r  | 1.53  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
   |                                 |       |                 |         |             | 'Multiprocessor Free')                   |
   +---------------------------------+-------+-----------------+---------+-------------+------------------------------------------+
