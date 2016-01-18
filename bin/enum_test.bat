@echo off
set enum=awk -f ..\src\enum.awk
::set enum=awka -x -f ..\src\enum.awk --

set bat_dir=%~dp0
cd /D %bat_dir%

echo:
echo ^> Help
%enum% -vcmd=help

echo:
echo ^> Look Up

set file_lst=%1
if "%file_lst%" == "" (
    set file_lst=LangID.h LayoutID.h
)

:LOOP
set /p "key=Enter the Key: "
if "%key%"=="" goto END

::FOR %%A IN (%file_lst%) DO (
::    %enum% -vkey=%key% %%A
::)
%enum% -vkey=%key% %file_lst%
echo:

set key=
goto LOOP

:END
