@echo off

cd rust-std-%rust_std_extra% && call install.bat --prefix="%PREFIX%\Library"

del /f /q %PREFIX%\Library\lib\rustlib\manifest-rust-std-%rust_std_extra%
del /f /q %PREFIX%\Library\lib\rustlib\rust-installer-version
del /f /q %PREFIX%\Library\lib\rustlib\install.log
del /f /q %PREFIX%\Library\lib\rustlib\components
del /f /q %PREFIX%\Library\lib\rustlib\uninstall.sh
