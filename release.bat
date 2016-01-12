@echo off

set bin_dir=enum-lookup-bin
set target=enum

if not exist %bin_dir% (
    md %bin_dir%
)

call build.bat %target% SkipPause
move %target%.exe %bin_dir%

copy tests\%target%.bat %bin_dir%
copy tests\*.h %bin_dir%
copy doc\README.rst %bin_dir%\README.txt

pause
