@echo off

cd rust-std-%rust_std_extra% && call install.bat --prefix="%PREFIX%"

del /f /q %PREFIX%\lib\rustlib\manifest-rust-std-%rust_std_extra%
del /f /q %PREFIX%\lib\rustlib\rust-installer-version
del /f /q %PREFIX%\lib\rustlib\install.log
del /f /q %PREFIX%\lib\rustlib\components
del /f /q %PREFIX%\lib\rustlib\uninstall.sh
