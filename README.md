# Introduction #

Look-up a name (enumerator) or a value (an integer) of C enumerations.


# Install #

1. Download a binary distribution (e.g., *EnumLookup-2.0-bin.zip*) from
   [Downloads](https://bitbucket.org/YorkJong/awkenumlookup/downloads) page.
2. Uncompress the binary distribution.
3. Put the following file at the same directory
    * *enum.exe*
    * *enum.bat*
    * your C header files containing enumerations
4. Execute *enum.bat*


# Usage #

1. Execute the *enum.bat*
2. Key in a number to look-up corresponding names (enumerators);
   key in a names (enumerators) to look-up its corresponding value (an integer).


# Command Line #

```
Usage: enum.exe -v key=value InputFiles
       enum.exe -v cmd=help
       enum.exe -v cmd=version
```