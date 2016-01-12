@echo off

set bin_dir=enum-lookup-bin

if not exist %bin_dir% (
    md %bin_dir%
)
call build.bat enum SkipPause
move enum.exe %bin_dir%

copy tests\enum.bat %bin_dir%
copy tests\*.h %bin_dir%

pause
