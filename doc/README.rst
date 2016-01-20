====
enum
=====
-----------
Enum Lookup
-----------
:Author: Jiang Yu-Kuan
:Contact: yukuan.jiang@gmail.com
:Revision: 0011
:Date: 2016-01-20


Introduction
============
EnumLookup is an open source AWK application to look-up a name (enumerator) or
a value (an integer) of C enumerations.

For the ease of use on Windows, the AWK script is compiled into an EXE manner
and is wrapped into a batch file.


Install
=======
1. Download a binary distribution (e.g., *EnumLookup-2.0-bin.zip*) from
   `Downloads <https://bitbucket.org/YorkJong/awkenumlookup/downloads>`_ page.
2. Uncompress the binary distribution.
3. Put the following files at the same directory
    * *enum.exe*
    * *enum.bat*
    * your C header files containing enumerations


Getting Started
===============
1. Install EnumLookup.
2. Execute the *enum.bat*.
3. Look-up:
    * Key in a number to look-up corresponding names (enumerators);
    * Key in a name (enumerator) to look-up corresponding value (an integer).


Command Line
============
::

Usage: enum.exe -v key=value InputFiles
       enum.exe -v cmd=help
       enum.exe -v cmd=version
