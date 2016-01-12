@echo off

set src_dir=src

set target=%1
if "%target%"=="" (
    set /p "target=Enter the target: "
)

awka -X -f %src_dir%\%target%.awk
ren awka.out %target%.exe

del awka_out.c


if not "%2"=="SkipPause" pause
