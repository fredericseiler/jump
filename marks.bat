@echo off
if not defined HOME set HOME=%USERPROFILE%
if not defined MARKPATH set MARKPATH=%HOME%\.marks
for /f "delims=" %%a in ('dir /A-D /B "%MARKPATH%" 2^>nul') do call :marks "%%a"
exit /b
:marks
for /f "delims=" %%a in ('type "%MARKPATH%\%~1"') do call :echo "%~1" "%%~a"
exit /b
:echo
if "%~1"=="_back" exit /b
if not exist "%~2" echo %~1 -^> ?
if exist "%~2" echo %~1 -^> %~2
exit /b