@echo off
REM Copy necessary stuff from build directory to a seperate location (e.g. env var JDK_BUILD_DIR)
setlocal

if "%1"=="-h"     goto echo_usage
if "%1"=="-help"  goto echo_usage
if "%1"=="--help" goto echo_usage
if "%1"=="/?"     goto echo_usage
if "%1"==""       goto echo_usage
if "%2"==""       goto echo_usage

set builddir=%1
set targetdir=%2

@echo Copying stuff from %builddir% to %targetdir%

xcopy /E /Y %builddir%\support\gensrc %targetdir%\support\gensrc\

goto schluss

:echo_usage
@echo Usage:
@echo.
@echo copyFromBuildDir ^<build directory^> ^<target directory^>
@echo.
@echo This script copies everything that the JDK eclipse projects need from the build directory.
@echo.

:schluss

endlocal
