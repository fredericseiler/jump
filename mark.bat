@echo off
if not defined HOME set HOME=%USERPROFILE%
if not defined MARKPATH set MARKPATH=%HOME%\.marks
if .%1==. call :mark_with_folder_name "%cd%"
if .%1==.. call :mark_with_folder_name "%cd%"
if not .%1==. if not .%1==.. call :mark "%~1" "%cd%"
exit /b
:mark
if not exist "%MARKPATH%" mkdir "%MARKPATH%">nul 2>&1
set _answer=n
if exist "%MARKPATH%\%~1" call :ask "%~1" "%~2"
if not defined _answer exit /b
set _answer=
>"%MARKPATH%\%~1" echo %~2
exit /b
:mark_with_folder_name
if .%~n1==. call :mark_with_drive_name "%~d1" "%~1"
if not .%~n1==. call :mark "%~n1" "%~1"
exit /b
:mark_with_drive_name
set _drive_name=%~1
set _drive_name=%_drive_name:~0,-1%
call :mark "%_drive_name%" "%~2"
set _drive_name=
exit /b
:ask
set /p _answer="Mark %~2 as %~1? (y/n) "
if /i not .%_answer%==.y set _answer=
exit /b