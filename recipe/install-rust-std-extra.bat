@echo off
setlocal enabledelayedexpansion

set "DESTDIR=%LIBRARY_PREFIX%"
set "SRCDIR=%SRC_DIR%\rust-std-%rust_std_extra%"

echo Installing rust-std-%rust_std_extra% from %SRCDIR% to %DESTDIR%

REM Read components and install each one
for /f "usebackq tokens=*" %%c in ("%SRCDIR%\components") do (
    echo Installing component: %%c
    set "COMPDIR=%SRCDIR%\%%c"
    
    REM Copy lib directory if exists  
    if exist "!COMPDIR!\lib" (
        xcopy /E /I /Y "!COMPDIR!\lib" "%DESTDIR%\lib\"
    )
)

REM Clean up installer metadata files
del /f /q "%DESTDIR%\lib\rustlib\manifest-rust-std-%rust_std_extra%" 2>nul
del /f /q "%DESTDIR%\lib\rustlib\rust-installer-version" 2>nul
del /f /q "%DESTDIR%\lib\rustlib\install.log" 2>nul
del /f /q "%DESTDIR%\lib\rustlib\components" 2>nul
del /f /q "%DESTDIR%\lib\rustlib\uninstall.sh" 2>nul

echo rust-std-%rust_std_extra% installation complete.
exit /b 0
