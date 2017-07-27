====================
NOTE on AWK and AWKA
====================
:Author: Jiang Yu-Kuan
:Contact: yukuan.jiang@gmail.com
:Revision: 0004
:Date: 2017-07-27

.. contents::

How to install AWKA for Windows
================================
1. Download MingGW compiler binaries from http://www.mingw.org
   and install the compiler on your Win32 system.
    1. Use MinGW Installer (mingw-get-setup.exe) to install MinGW and MSYS
    2. Edit fstab in C:\MinGW\msys\1.0\etc

2. Download awka.zip from http://www.klabaster.com/freeware.htm
   and copy 3 files included in this distribution into the specified
   directories.
    1. Copy "libawka.h" into the "include" sub-directory at your
      MinGW32 installation path (e.g., C:\MinGW\include\).
    2. Copy libawka.a into your "lib" sub-directory at your
      MinGW32 installation path (e.g., C:\MinGW\lib).
    3. Copy awka.exe e.g. into your "bin" sub-directory at your
      MinGW32 installation path (that should be included into your PATH
      variable) so that it can be used at the command line of your DOS
      Windows (e.g., C:\MinGW\bin\).
    4. You can test your installation by using the sample batch file:
      "compileAWK.bat" included in this distribituion.
Note:
* GnuWin32 Version in https://sourceforge.net/projects/gnuwin32/files/awka/
  cannot properly running with MinGW


How to Get the AWK for Windows
==============================
1. From MinGW with MSYS project (http://www.mingw.org)
   * The awk is at Msys' bin directory (e.g., C:\MinGW\msys\1.0\bin)
   * NOTE: A lot of BUGs in this version (3.1.7)
2. From GnuWin32 project (http://gnuwin32.sourceforge.net/packages/gawk.htm)
   * NOTE: at Ver3.1.6, pattern with [...] will lead to "buffer: ." messages
3. From http://www.klabaster.com/freeware.htm (gawk4.zip; version 4.1.3)
   * I used this version finally
   * Support \s, \w

Bug in the GAWK
===============
4.1.3 (fom http://www.klabaster.com/freeware.htm)
-------------------------------------------------
* Cannot recognize \d pattern
* Cannot recognize FS="||"; must replace it with FS="[|]{2}" or FS="[|][|]"
* The FILENAME buid-in variable is not supported

3.1.6 (Gawk for Windows, GnuWin32)
----------------------------------
* pattern with [...] will lead to "buffer: ." messages


Problems in the AWKA
====================
0.7.5 from http://www.klabaster.com/freeware.htm
------------------------------------------------
* GAWK runs *END* rule after executing an *exit* statement, but AWKA don't.
* The split function is not supported
* The FILENAME buid-in variable is not supported
* Cannot properly run this function when x is not a number
    function isnum(x) {
        return x+0 == x
    }
* Do not support \s in the pattern of a pattern-action statement
* Do not support \s in the regexp of match()
  * can replace it with [[:space:]]
  * can replace it with [ \t]
* Support \s in the regexp of sub()
* Do not support "/dev/stdin" in gawk
* Cannot get correct result by using regexp "\/\/" or "\/{2}" in sub(), gsub()
  * The following is an example:
    a = "///////"
    sub(/\/\//, "#", a)
    gsub(/\/\//, "--", a)
    sub(/-\/\s*$/, "--", a)
  * To get right result, you can use the code as follows
    a = "///////"
    sub(/[\/][\/]/, "#", a)
    gsub(/[\/][\/]/, "--", a)
    sub(/-\/\s*$/, "--", a)
* Cannot recognize FS="||" or FS="[|]{2}"; must replace them with "[|][|]"

