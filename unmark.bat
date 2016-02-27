@echo off
if .%1==. exit /b 1
if not defined HOME set HOME=%USERPROFILE%
if not defined MARKPATH set MARKPATH=%HOME%\.marks
if not exist "%MARKPATH%\%~1" echo No such mark: %~1
if not exist "%MARKPATH%\%~1" exit /b 1
del /F "%MARKPATH%\%~1">nul 2>&1
exit /b 0