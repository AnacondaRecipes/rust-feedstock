@echo off
setlocal enabledelayedexpansion

set "DESTDIR=%LIBRARY_PREFIX%"
set "SRCDIR=%SRC_DIR%\rust-src"

echo Installing rust-src from %SRCDIR% to %DESTDIR%

REM Read components and install each one (the tarball has just "rust-src").
for /f "usebackq tokens=*" %%c in ("%SRCDIR%\components") do (
    echo Installing component: %%c
    set "COMPDIR=%SRCDIR%\%%c"

    if exist "!COMPDIR!\lib" (
        xcopy /E /I /Y /Q "!COMPDIR!\lib" "%DESTDIR%\lib\"
        if errorlevel 1 exit /b 1
    )
)

if not exist "%DESTDIR%\lib\rustlib\src\rust\library\Cargo.lock" exit /b 1

echo rust-src installation complete.
exit /b 0
