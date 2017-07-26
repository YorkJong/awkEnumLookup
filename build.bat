@echo off

set bat_dir=%~dp0
cd /D %bat_dir%

set src_dir=src

set target=%1
if "%target%"=="" (
    set /p "target=Enter the target: "
)

:: split out the main filename
For %%A in ("%target%") do (
    set target=%%~nA
)

awka -X -f %src_dir%\%target%.awk
ren awka.out %target%.exe
move %target%.exe bin

del awka_out.c


if not "%2"=="SkipPause" pause
