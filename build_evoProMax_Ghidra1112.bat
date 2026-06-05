@echo off
setlocal
if "%GHIDRA_INSTALL_DIR%"=="" (
  echo Set GHIDRA_INSTALL_DIR first, for example:
  echo   set GHIDRA_INSTALL_DIR=C:\ghidra_11.1.2_PUBLIC
  exit /b 1
)
where gradle >nul 2>nul
if errorlevel 1 (
  echo Gradle not found in PATH. Use the Gradle version recommended by your Ghidra 11.1.2 application.properties.
  exit /b 1
)
gradle -PGHIDRA_INSTALL_DIR="%GHIDRA_INSTALL_DIR%" buildExtension
endlocal
