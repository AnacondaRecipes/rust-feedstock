@echo off
setlocal enabledelayedexpansion

set "DESTDIR=%LIBRARY_PREFIX%"
set "SRCDIR=%SRC_DIR%\gnu"

echo Installing Rust GNU from %SRCDIR% to %DESTDIR%

REM Read components and install each one
for /f "usebackq tokens=*" %%c in ("%SRCDIR%\components") do (
    echo Installing component: %%c
    set "COMPDIR=%SRCDIR%\%%c"
    
    REM Copy bin directory if exists
    if exist "!COMPDIR!\bin" (
        xcopy /E /I /Y "!COMPDIR!\bin" "%DESTDIR%\bin\"
        if errorlevel 1 exit /b 1
    )
    
    REM Copy lib directory if exists  
    if exist "!COMPDIR!\lib" (
        xcopy /E /I /Y "!COMPDIR!\lib" "%DESTDIR%\lib\"
        if errorlevel 1 exit /b 1
    )
    
    REM Copy share directory if exists
    if exist "!COMPDIR!\share" (
        xcopy /E /I /Y "!COMPDIR!\share" "%DESTDIR%\share\"
        if errorlevel 1 exit /b 1
    )
    
    REM Copy etc directory if exists
    if exist "!COMPDIR!\etc" (
        xcopy /E /I /Y "!COMPDIR!\etc" "%DESTDIR%\etc\"
        if errorlevel 1 exit /b 1
    )

    REM Copy libexec directory if exists
    if exist "!COMPDIR!\libexec" (
        xcopy /E /I /Y "!COMPDIR!\libexec" "%DESTDIR%\libexec\"
        if errorlevel 1 exit /b 1
    )
)

REM Remove documentation to reduce package size (docs available online)
if exist "%DESTDIR%\share\doc" (
    echo Removing documentation...
    rmdir /S /Q "%DESTDIR%\share\doc"
)

echo Rust GNU installation complete.
exit /b 0
