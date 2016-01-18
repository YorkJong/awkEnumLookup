@echo off

set ver_num=v2.0
set target=enum

set dist_dir=EnumLookup
set dy=%date:~0,4%
set dm=%date:~5,2%
set dd=%date:~8,2%
set dist_dir=%dist_dir%-%ver_num%-bin-%dy%%dm%%dd%

if not exist %dist_dir% (
    md %dist_dir%
)
set _7z="C:\Program Files\7-Zip\7z.exe"

call build.bat %target% SkipPause

xcopy /Y bin %dist_dir%\
del %dist_dir%\%target%_test.bat
copy README.md %dist_dir%\README.txt

%_7z% a -tzip %dist_dir%.zip %dist_dir%\
rd /s /q %dist_dir%

pause
