@echo off

cd rust-std-%rust_std_extra%

FOR /F "delims=" %%i in ('cygpath.exe -u "%PREFIX%"') DO set "pfx=%%i"
bash install.sh --prefix=%pfx%/Library
if errorlevel 1 exit 1

del /f /q %PREFIX%\Library\lib\rustlib\manifest-rust-std-%rust_std_extra%
del /f /q %PREFIX%\Library\lib\rustlib\rust-installer-version
del /f /q %PREFIX%\Library\lib\rustlib\install.log
del /f /q %PREFIX%\Library\lib\rustlib\components
del /f /q %PREFIX%\Library\lib\rustlib\uninstall.sh
