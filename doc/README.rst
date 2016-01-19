====
enum
=====
-----------
Enum Lookup
-----------
:Author: Jiang Yu-Kuan
:Contact: yukuan.jiang@gmail.com
:Revision: 0010
:Date: 2016-01-20


Introduction
============
Look-up a name (enumerator) or a value (an integer) of C enumerations.


Install
=======
1. Download a binary distribution (e.g., *EnumLookup-2.0-bin.zip*) from
   `Downloads <https://bitbucket.org/YorkJong/awkenumlookup/downloads>`_ page.
2. Uncompress the binary distribution.
3. Copy *enum.exe* and *enum.bat* to a directory containing C header files, or
   copy C header files to the directory containing *enum.exe* and *enum.bat*
4. Execute *enum.bat*


Usage
=====
1. Execute the *enum.bat*
2. Key in a number to look-up corresponding names (enumerators);
   key in a names (enumerators) to look-up its corresponding value (an integer).


Command Line
============
::

Usage: enum.exe -v key=value InputFiles
       enum.exe -v cmd=help
       enum.exe -v cmd=version
