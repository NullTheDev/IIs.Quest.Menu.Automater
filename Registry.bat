@echo off
setlocal enabledelayedexpansion
title Quest 3 ADB Automater
mode 90,35

set "red=[38;2;255;80;80m"
set "green=[38;2;120;255;120m"
set "yellow=[38;2;255;220;120m"
set "cyan=[38;2;120;255;255m"
set "white=[0m"

call :Header
echo [*] Initializing local environment...
call :SetupDependencies
call :SetupExploitFiles

:ConnectionPhase
cls
call :Header
echo [READY] Local components verified.
echo.
echo Connect Quest 3 via USB or ensure Wi-Fi Debugging is active.
echo.

set /a timer=0
:AttemptConnection
adb start-server >nul 2>&1
adb devices | findstr /r "\<device\>" >nul
if %errorlevel% == 0 goto :ADBProcess

set /a timer+=1
if %timer% geq 10 goto :PromptIP

<nul set /p "=[2K[*] Searching for device... %timer%/10[1G"
timeout /t 1 /nobreak >nul
goto :AttemptConnection

:PromptIP
cls
call :Header
echo [!] No USB Device Detected.
echo.
set /p "targetIP=Enter Quest IP: "
if "%targetIP%"=="" goto :PromptIP

echo [*] Connecting to %targetIP%...
adb connect %targetIP% >nul 2>&1
adb devices | findstr /r "\<device\>" >nul
if %errorlevel% neq 0 (
    echo [ERROR] Connection failed. Check IP and Wi-Fi.
    timeout /t 2 >nul
    goto :PromptIP
)

:ADBProcess
cls
echo ==============================================
echo                 ADB PROCESS                   
echo ==============================================
echo.
call :DeviceProcess

cls
echo ==============================================
echo            CRITICAL SAFETY CHECK              
echo ==============================================
echo.
echo  1. Launch Gorilla Tag on the headset.
echo  2. Wait for all Cosmetics to load in.
echo.
echo [!] WARNING: BRICK RISK IF EXECUTED PREMATURELY.
echo.
pause
echo [1/3] Confirming Gorilla Tag Status... & pause >nul
echo [2/3] Confirming Cosmetics Status... & pause >nul
echo [3/3] EXECUTING EXPLOIT... & pause >nul

if exist "temp_exploit\run.bat" (
    pushd temp_exploit
    start /min run.bat
    popd
    echo.
    echo [SUCCESS] Exploit process initialized in background.
)

echo.
echo ==============================================
echo                PROCESS COMPLETE               
echo ==============================================
pause
exit /b

:Header
echo ==============================================
echo       QUEST 3 MODDING ENVIRONMENT SETUP      
echo ==============================================
echo.
exit /b

:SetupDependencies
curl --version >nul 2>&1 || (powershell -Command "iwr https://curl.se/windows/latest.zip -OutFile curl.zip" >nul 2>&1)
adb version >nul 2>&1 || (
    curl -L -sS -o pt.zip https://dl.google.com/android/repository/platform-tools-latest-windows.zip
    powershell -Command "Expand-Archive -Path pt.zip -DestinationPath . -Force" >nul 2>&1
    xcopy /e /y "platform-tools\*" "." >nul 2>&1
    rd /s /q "platform-tools" >nul 2>&1
    del /f pt.zip
)
python --version >nul 2>&1 || (
    curl -L -sS -o py.exe https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe
    start /wait py.exe /quiet InstallAllUsers=1 PrependPath=1
    del py.exe
    for /f "tokens=*" %%a in ('powershell -Command "[System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path', 'User')"') do set "PATH=%%a"
)
frida --version >nul 2>&1 || pip install frida-tools >nul 2>&1
exit /b

:SetupExploitFiles
if not exist "cheese" curl -L -sS -o cheese "https://github.com/NullTheDev/IIs.Quest.Menu.Automater/raw/refs/heads/main/cheese"
if not exist "frida-server" curl -L -sS -o frida-server "https://drive.iidk.online/src/Quest3-Root/frida-server"
if not exist "temp_exploit" (
    curl -L -sS -o ex.zip "https://github.com/iiDk-the-actual/iis.Quest.Menu/archive/refs/heads/main.zip"
    powershell -Command "Expand-Archive -Path ex.zip -DestinationPath tf -Force" >nul 2>&1
    for /d %%i in (tf\*) do move "%%i" "temp_exploit" >nul 2>&1
    rd /s /q tf >nul 2>&1
    del /f ex.zip
)
exit /b

:DeviceProcess
echo [+] Device linked.
adb tcpip 5555 >nul 2>&1
adb push cheese /data/local/tmp/ >nul 2>&1
adb push frida-server /data/local/tmp/ >nul 2>&1
adb shell "chmod +x /data/local/tmp/cheese"
adb shell "chmod +x /data/local/tmp/frida-server"
for /f "delims=" %%i in ('adb shell "/data/local/tmp/cheese" 2^>^&1') do (
    echo %%i | findstr /C:"can't get GPU r/w" >nul && (
        echo [!] GPU Error: A device reboot is required.
        pause
        exit
    )
)
adb shell "/data/local/tmp/frida-server &"
echo [+] Remote services started.
exit /b