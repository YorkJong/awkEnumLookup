@echo off

set target=%1
if "%target%"=="" (
    set /p "target=Enter the target: "
)

del %target%.exe
awka -X -f %target%.awk
ren awka.out %target%.exe

del awka_out.c

pause
