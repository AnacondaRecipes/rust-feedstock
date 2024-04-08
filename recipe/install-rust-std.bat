pushd rust-std

echo %target_platform%

echo %PKG_NAME% > ./components

FOR /F "delims=" %%i in ('cygpath.exe -u "%PREFIX%"') DO set "pfx=%%i"
bash -lce "%SRC_DIR%/install.sh" --prefix=%pfx%/Library
if errorlevel 1 exit 1
