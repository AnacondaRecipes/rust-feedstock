pushd rust-std
FOR /F "delims=" %%i in ('cygpath.exe -u "%PREFIX%"') DO set "pfx=%%i"
bash -lce "%SRC_DIR%/install-rust-std.sh" --prefix=%pfx%/Library
if errorlevel 1 exit 1
