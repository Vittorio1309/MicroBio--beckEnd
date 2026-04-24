@echo off
setlocal
set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_HOME=%DIRNAME%
set M2_HOME=%USERPROFILE%\.m2\wrapper\apache-maven-3.6.3
if not exist "%M2_HOME%\bin\mvn.cmd" (
    echo Downloading Maven 3.6.3...
    if not exist "%USERPROFILE%\.m2\wrapper" mkdir "%USERPROFILE%\.m2\wrapper"
    bitsadmin /transfer "DownloadMaven" https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip "%USERPROFILE%\.m2\wrapper\maven.zip"
    if not exist "%USERPROFILE%\.m2\wrapper\maven.zip" (
        echo ERROR: Failed to download Maven
        exit /b 1
    )
    echo Extracting Maven...
    cd /d "%USERPROFILE%\.m2\wrapper"
    tar -xf maven.zip
    if exist maven.zip del maven.zip
    cd /d "%APP_HOME%"
    echo Maven downloaded successfully.
    echo.
)
set MAVEN_HOME=%M2_HOME%
"%MAVEN_HOME%\bin\mvn.cmd" %*
endlocal
