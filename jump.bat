@echo off
if .%1==. exit /b 1
if not defined HOME set HOME=%USERPROFILE%
if not defined MARKPATH set MARKPATH=%HOME%\.marks
if not exist "%MARKPATH%\%~1" echo No such mark: %~1
if not exist "%MARKPATH%\%~1" exit /b 1
for /f "delims=" %%a in ('type "%MARKPATH%\%~1"') do call :cd "%~1" "%%~a"
exit /b %errorlevel%
:cd
if not exist "%~2" echo %~1	-^> ^?
if not exist "%~2" exit /b 1
cd /D "%~2"
exit /b 0