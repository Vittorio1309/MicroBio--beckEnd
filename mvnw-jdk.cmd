@echo off
setlocal enabledelayedexpansion

echo.
echo ===== MicroBio Spring Boot Maven Wrapper =====
echo.

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_HOME=%DIRNAME%

REM Check and setup JDK if needed
set JDK_HOME=%USERPROFILE%\.m2\wrapper\jdk8
if not exist "%JDK_HOME%\bin\javac.exe" (
    echo Downloading AdoptOpenJDK 8...
    echo.

    if not exist "%USERPROFILE%\.m2\wrapper" mkdir "%USERPROFILE%\.m2\wrapper"

    REM Download AdoptOpenJDK 8 (lighter weight)
    bitsadmin /transfer "DownloadJDK8" https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u382-b05/OpenJDK8U-jdk_x64_windows_8u382b05.zip "%USERPROFILE%\.m2\wrapper\jdk8.zip"

    if not exist "%USERPROFILE%\.m2\wrapper\jdk8.zip" (
        echo ERROR: Failed to download JDK
        echo.
        echo Please manually download and install a JDK from:
        echo https://adoptium.net/temurin/releases/?version=8
        exit /b 1
    )

    echo Extracting JDK...
    cd /d "%USERPROFILE%\.m2\wrapper"
    tar -xf jdk8.zip

    REM Find the extracted folder and rename it
    for /d %%D in (jdk*) do (
        if exist "%%D" (
            ren "%%D" "jdk8_temp"
        )
    )

    if exist "jdk8_temp" (
        ren "jdk8_temp" "jdk8"
    )

    if exist jdk8.zip del jdk8.zip
    cd /d "%APP_HOME%"
)

REM Set JAVA_HOME to the JDK we found/downloaded
set JAVA_HOME=%JDK_HOME%
set PATH=%JDK_HOME%\bin;%PATH%

REM Setup Maven
set M2_HOME=%USERPROFILE%\.m2\wrapper\apache-maven-3.6.3

if not exist "%M2_HOME%\bin\mvn.cmd" (
    echo.
    echo Downloading Maven 3.6.3...
    echo.

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
)

REM Execute Maven
set MAVEN_HOME=%M2_HOME%
"%MAVEN_HOME%\bin\mvn.cmd" %*

endlocal

