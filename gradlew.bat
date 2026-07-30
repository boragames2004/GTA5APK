@echo off
setlocal
set GRADLE_VERSION=8.9
set BASE_DIR=%~dp0
set CACHE_ROOT=%USERPROFILE%\.gradle\custom-wrapper
set CACHE_DIR=%CACHE_ROOT%\gradle-%GRADLE_VERSION%
set ZIP_FILE=%CACHE_ROOT%\gradle-%GRADLE_VERSION%-bin.zip
if not exist "%CACHE_DIR%\bin\gradle.bat" (
  if not exist "%CACHE_ROOT%" mkdir "%CACHE_ROOT%"
  echo Gradle %GRADLE_VERSION% indiriliyor...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%ZIP_FILE%'"
  if errorlevel 1 exit /b 1
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%CACHE_ROOT%' -Force"
  if errorlevel 1 exit /b 1
)
call "%CACHE_DIR%\bin\gradle.bat" -p "%BASE_DIR%" %*
endlocal
