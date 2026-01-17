@echo off
setlocal enabledelayedexpansion

set "DESTDIR=%LIBRARY_PREFIX%"
set "SRCDIR=%SRC_DIR%\msvc"

echo Installing Rust from %SRCDIR% to %DESTDIR%

REM Read components and install each one
for /f "usebackq tokens=*" %%c in ("%SRCDIR%\components") do (
    echo Installing component: %%c
    set "COMPDIR=%SRCDIR%\%%c"
    
    REM Copy bin directory if exists
    if exist "!COMPDIR!\bin" (
        xcopy /E /I /Y "!COMPDIR!\bin" "%DESTDIR%\bin\"
    )
    
    REM Copy lib directory if exists  
    if exist "!COMPDIR!\lib" (
        xcopy /E /I /Y "!COMPDIR!\lib" "%DESTDIR%\lib\"
    )
    
    REM Copy share directory if exists
    if exist "!COMPDIR!\share" (
        xcopy /E /I /Y "!COMPDIR!\share" "%DESTDIR%\share\"
    )
    
    REM Copy etc directory if exists
    if exist "!COMPDIR!\etc" (
        xcopy /E /I /Y "!COMPDIR!\etc" "%DESTDIR%\etc\"
    )
)

REM Remove documentation to reduce package size (docs available online)
if exist "%DESTDIR%\share\doc" (
    echo Removing documentation...
    rmdir /S /Q "%DESTDIR%\share\doc"
)

echo Rust installation complete.
exit /b 0
