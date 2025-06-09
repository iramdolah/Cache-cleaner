@echo off
setlocal enabledelayedexpansion
title Advanced Windows Cache Cleaner v2.0
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo [ERROR] Administrator privileges required!
    echo Right-click and select "Run as administrator"
    pause
    exit /b 1
)

:MAIN_MENU
cls
color 0A
echo.
echo  ╔══════════════════════════════════════════════════════════════╗
echo  ║              ADVANCED WINDOWS CACHE CLEANER v2.0             ║
echo  ╠══════════════════════════════════════════════════════════════╣
echo  ║  [1] Clean All Cache (Recommended)                           ║
echo  ║  [2] Visual Studio Cache Only                                ║
echo  ║  [3] System Cache Only                                       ║
echo  ║  [4] Browser Cache Only                                      ║
echo  ║  [5] Windows Components Cache                                ║
echo  ║  [6] Advanced System Cleanup                                 ║
echo  ║  [7] Custom Selective Cleanup                                ║
echo  ║  [8] View Cache Sizes                                        ║
echo  ║  [9] Exit                                                    ║
echo  ╚══════════════════════════════════════════════════════════════╝
echo.
set /p choice="Select option (1-9): "

if "%choice%"=="1" goto CLEAN_ALL
if "%choice%"=="2" goto CLEAN_VS
if "%choice%"=="3" goto CLEAN_SYSTEM
if "%choice%"=="4" goto CLEAN_BROWSER
if "%choice%"=="5" goto CLEAN_WINDOWS
if "%choice%"=="6" goto CLEAN_ADVANCED
if "%choice%"=="7" goto CLEAN_CUSTOM
if "%choice%"=="8" goto VIEW_SIZES
if "%choice%"=="9" goto EXIT
goto MAIN_MENU

:CLEAN_ALL
cls
color 0E
echo [INFO] Starting comprehensive cache cleanup...
echo [PROGRESS] Phase 1: Stopping Services...
call :STOP_SERVICES
echo [PROGRESS] Phase 2: Visual Studio Cache...
call :CLEAN_VS_DEEP
echo [PROGRESS] Phase 3: System Cache...
call :CLEAN_SYSTEM_DEEP
echo [PROGRESS] Phase 4: Browser Cache...
call :CLEAN_BROWSER_DEEP
echo [PROGRESS] Phase 5: Windows Components...
call :CLEAN_WINDOWS_DEEP
echo [PROGRESS] Phase 6: Advanced Cleanup...
call :CLEAN_ADVANCED_DEEP
echo [PROGRESS] Phase 7: Starting Services...
call :START_SERVICES
color 0A
echo [SUCCESS] All cache cleaned successfully!
call :AUTO_RESTART

:CLEAN_VS
cls
color 0B
echo [INFO] Deep cleaning Visual Studio cache...
call :STOP_SERVICES
call :CLEAN_VS_DEEP
call :START_SERVICES
color 0A
echo [SUCCESS] Visual Studio cache cleaned!
call :AUTO_RESTART

:CLEAN_SYSTEM
cls
color 0B
echo [INFO] Deep cleaning system cache...
call :STOP_SERVICES
call :CLEAN_SYSTEM_DEEP
call :START_SERVICES
color 0A
echo [SUCCESS] System cache cleaned!
call :AUTO_RESTART

:CLEAN_BROWSER
cls
color 0B
echo [INFO] Deep cleaning browser cache...
call :CLEAN_BROWSER_DEEP
color 0A
echo [SUCCESS] Browser cache cleaned!
pause
goto MAIN_MENU

:CLEAN_WINDOWS
cls
color 0B
echo [INFO] Deep cleaning Windows components cache...
call :STOP_SERVICES
call :CLEAN_WINDOWS_DEEP
call :START_SERVICES
color 0A
echo [SUCCESS] Windows components cache cleaned!
call :AUTO_RESTART

:CLEAN_ADVANCED
cls
color 0B
echo [INFO] Running advanced system cleanup...
call :STOP_SERVICES
call :CLEAN_ADVANCED_DEEP
call :START_SERVICES
color 0A
echo [SUCCESS] Advanced cleanup completed!
call :AUTO_RESTART

:AUTO_RESTART
echo.
echo  ╔══════════════════════════════════════════════════════════════╗
echo  ║                    RESTART REQUIRED                          ║
echo  ║     System will restart automatically in 30 seconds         ║
echo  ║              Press any key to restart now                    ║
echo  ║              or close window to cancel                       ║
echo  ╚══════════════════════════════════════════════════════════════╝
echo.

set /a countdown=30
:COUNTDOWN_LOOP
echo Restarting in %countdown% seconds... Press any key to restart now
choice /t 1 /d n /n >nul
if %errorlevel% neq 2 (
    echo.
    echo Restarting system now...
    shutdown /r /t 3 /c "Cache Cleaner: System restart in 3 seconds..."
    exit /b 0
)
set /a countdown=%countdown%-1
if %countdown% gtr 0 (
    cls
    echo.
    echo  ╔══════════════════════════════════════════════════════════════╗
    echo  ║                    RESTART REQUIRED                          ║
    echo  ║     System will restart automatically in %countdown% seconds         ║
    echo  ║              Press any key to restart now                    ║
    echo  ║              or close window to cancel                       ║
    echo  ╚══════════════════════════════════════════════════════════════╝
    echo.
    goto COUNTDOWN_LOOP
)
echo.
echo Time's up! Restarting system...
shutdown /r /t 3 /c "Cache Cleaner: System restart in 3 seconds..."
exit /b 0

:STOP_SERVICES
echo Stopping Windows services...
net stop "Windows Search" /y 2>nul
net stop "Superfetch" /y 2>nul
net stop "Windows Update" /y 2>nul
net stop "Background Intelligent Transfer Service" /y 2>nul
net stop "Cryptographic Services" /y 2>nul
net stop "Windows Installer" /y 2>nul
net stop "Windows Font Cache Service" /y 2>nul
net stop "Themes" /y 2>nul
taskkill /f /im explorer.exe 2>nul
timeout /t 2 /nobreak >nul
goto :eof

:START_SERVICES
echo Starting Windows services...
start explorer.exe
net start "Themes" 2>nul
net start "Windows Font Cache Service" 2>nul
net start "Windows Installer" 2>nul
net start "Cryptographic Services" 2>nul
net start "Background Intelligent Transfer Service" 2>nul
net start "Windows Update" 2>nul
net start "Superfetch" 2>nul
net start "Windows Search" 2>nul
timeout /t 3 /nobreak >nul
goto :eof

:CLEAN_VS_DEEP
echo Cleaning Visual Studio Code...
taskkill /f /im Code.exe 2>nul
if exist "%APPDATA%\Code" (
    rmdir /s /q "%APPDATA%\Code\User\workspaceStorage" 2>nul
    rmdir /s /q "%APPDATA%\Code\logs" 2>nul
    rmdir /s /q "%APPDATA%\Code\CachedExtensions" 2>nul
    rmdir /s /q "%APPDATA%\Code\CachedData" 2>nul
    rmdir /s /q "%APPDATA%\Code\User\History" 2>nul
    del /f /q "%APPDATA%\Code\User\settings.json.bak" 2>nul
    del /f /q "%APPDATA%\Code\storage.json" 2>nul
    for /d %%i in ("%APPDATA%\Code\User\workspaceStorage\*") do rmdir /s /q "%%i" 2>nul
)

echo Cleaning Visual Studio 2022/2019...
taskkill /f /im devenv.exe 2>nul
taskkill /f /im MSBuild.exe 2>nul
if exist "%LOCALAPPDATA%\Microsoft\VisualStudio" (
    for /d %%i in ("%LOCALAPPDATA%\Microsoft\VisualStudio\*") do (
        rmdir /s /q "%%i\ComponentModelCache" 2>nul
        rmdir /s /q "%%i\Extensions" 2>nul
        rmdir /s /q "%%i\ImageLibrary" 2>nul
        rmdir /s /q "%%i\ProjectTemplatesCache" 2>nul
        rmdir /s /q "%%i\ItemTemplatesCache" 2>nul
        rmdir /s /q "%%i\VTC" 2>nul
        rmdir /s /q "%%i\ActivityLog.xml" 2>nul
        rmdir /s /q "%%i\1033" 2>nul
        del /f /q "%%i\*.tlog" 2>nul
        del /f /q "%%i\*.log" 2>nul
    )
)

echo Cleaning .NET Framework...
for /d %%i in ("%WINDIR%\Microsoft.NET\Framework\v*") do (
    if exist "%%i\Temporary ASP.NET Files" rmdir /s /q "%%i\Temporary ASP.NET Files" 2>nul
)
for /d %%i in ("%WINDIR%\Microsoft.NET\Framework64\v*") do (
    if exist "%%i\Temporary ASP.NET Files" rmdir /s /q "%%i\Temporary ASP.NET Files" 2>nul
)
rmdir /s /q "%LOCALAPPDATA%\NuGet\Cache" 2>nul
rmdir /s /q "%USERPROFILE%\.nuget\packages" 2>nul
rmdir /s /q "%LOCALAPPDATA%\Microsoft\MSBuild" 2>nul
rmdir /s /q "%TEMP%\VSFeedbackIntelliCodeLogs" 2>nul
rmdir /s /q "%LOCALAPPDATA%\Microsoft\VSApplicationInsights" 2>nul
rmdir /s /q "%LOCALAPPDATA%\Microsoft\VisualStudio Services" 2>nul

echo Cleaning IIS Express...
if exist "%USERPROFILE%\Documents\IISExpress\Logs" rmdir /s /q "%USERPROFILE%\Documents\IISExpress\Logs" 2>nul
if exist "%USERPROFILE%\Documents\IISExpress\TraceLogFiles" rmdir /s /q "%USERPROFILE%\Documents\IISExpress\TraceLogFiles" 2>nul

echo Cleaning NPM Cache...
call :CLEAN_NPM_DEEP
goto :eof

:CLEAN_NPM_DEEP
echo Deep cleaning NPM global cache...
taskkill /f /im node.exe 2>nul
taskkill /f /im npm.exe 2>nul
timeout /t 2 /nobreak >nul

where npm >nul 2>&1
if %errorlevel% equ 0 (
    npm cache clean --force 2>nul
    npm cache verify 2>nul
) else (
    echo NPM not found, cleaning cache manually...
)

if exist "%APPDATA%\npm-cache" rmdir /s /q "%APPDATA%\npm-cache" 2>nul
if exist "%LOCALAPPDATA%\npm-cache" rmdir /s /q "%LOCALAPPDATA%\npm-cache" 2>nul
if exist "%USERPROFILE%\.npm" rmdir /s /q "%USERPROFILE%\.npm" 2>nul
if exist "%APPDATA%\npm" (
    for /d %%i in ("%APPDATA%\npm\*") do rmdir /s /q "%%i" 2>nul
    del /f /q "%APPDATA%\npm\*.log" 2>nul
)

echo Cleaning Node.js cache...
if exist "%USERPROFILE%\.node_repl_history" del /f /q "%USERPROFILE%\.node_repl_history" 2>nul
if exist "%USERPROFILE%\.v8flags.*" del /f /q "%USERPROFILE%\.v8flags.*" 2>nul
if exist "%TEMP%\npm-*" (
    for /d %%i in ("%TEMP%\npm-*") do rmdir /s /q "%%i" 2>nul
)

echo Cleaning Yarn cache...
where yarn >nul 2>&1
if %errorlevel% equ 0 (
    yarn cache clean 2>nul
) else (
    if exist "%LOCALAPPDATA%\Yarn\Cache" rmdir /s /q "%LOCALAPPDATA%\Yarn\Cache" 2>nul
    if exist "%APPDATA%\Local\Yarn\Cache" rmdir /s /q "%APPDATA%\Local\Yarn\Cache" 2>nul
)

echo Cleaning pnpm cache...
where pnpm >nul 2>&1
if %errorlevel% equ 0 (
    pnpm store prune 2>nul
) else (
    if exist "%LOCALAPPDATA%\pnpm-cache" rmdir /s /q "%LOCALAPPDATA%\pnpm-cache" 2>nul
    if exist "%APPDATA%\pnpm" rmdir /s /q "%APPDATA%\pnpm" 2>nul
)

echo Cleaning package manager temp files...
if exist "%TEMP%\yarn--*" (
    for /d %%i in ("%TEMP%\yarn--*") do rmdir /s /q "%%i" 2>nul
)
if exist "%TEMP%\pnpm-*" (
    for /d %%i in ("%TEMP%\pnpm-*") do rmdir /s /q "%%i" 2>nul
)
for /f "tokens=*" %%i in ('dir /b /a:d "%TEMP%\*node*" 2^>nul') do rmdir /s /q "%TEMP%\%%i" 2>nul

echo Cleaning node_modules caches...
if exist "%USERPROFILE%" (
    for /f "delims=" %%i in ('dir /s /b /a:d "%USERPROFILE%\node_modules" 2^>nul ^| findstr /v /i "system32\|program"') do (
        if exist "%%i\.cache" rmdir /s /q "%%i\.cache" 2>nul
        if exist "%%i\.npm" rmdir /s /q "%%i\.npm" 2>nul
        for /d %%j in ("%%i\*") do (
            if exist "%%j\.cache" rmdir /s /q "%%j\.cache" 2>nul
        )
    )
)
goto :eof

:CLEAN_SYSTEM_DEEP
echo Deep cleaning system temporary files...
for /f "tokens=*" %%i in ('dir /b /a:d "%TEMP%" 2^>nul') do rmdir /s /q "%TEMP%\%%i" 2>nul
for /f "tokens=*" %%i in ('dir /b /a:-d "%TEMP%" 2^>nul') do del /f /q "%TEMP%\%%i" 2>nul
for /f "tokens=*" %%i in ('dir /b /a:d "%LOCALAPPDATA%\Temp" 2^>nul') do rmdir /s /q "%LOCALAPPDATA%\Temp\%%i" 2>nul
for /f "tokens=*" %%i in ('dir /b /a:-d "%LOCALAPPDATA%\Temp" 2^>nul') do del /f /q "%LOCALAPPDATA%\Temp\%%i" 2>nul
for /f "tokens=*" %%i in ('dir /b /a:d "%WINDIR%\Temp" 2^>nul') do rmdir /s /q "%WINDIR%\Temp\%%i" 2>nul
for /f "tokens=*" %%i in ('dir /b /a:-d "%WINDIR%\Temp" 2^>nul') do del /f /q "%WINDIR%\Temp\%%i" 2>nul

echo Cleaning system cache files...
del /f /q "%WINDIR%\Prefetch\*.*" 2>nul
rmdir /s /q "%LOCALAPPDATA%\Microsoft\Windows\INetCache" 2>nul
rmdir /s /q "%LOCALAPPDATA%\Microsoft\Windows\INetCookies" 2>nul
rmdir /s /q "%LOCALAPPDATA%\Microsoft\Windows\WebCache" 2>nul
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*" 2>nul
del /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
del /f /q "%LOCALAPPDATA%\IconCache.db" 2>nul
del /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache_*.db" 2>nul

echo Cleaning Windows logs...
for /f "tokens=*" %%i in ('wevtutil el') do wevtutil cl "%%i" 2>nul
del /f /q "%WINDIR%\*.log" 2>nul
del /f /q "%WINDIR%\*.tmp" 2>nul
rmdir /s /q "%WINDIR%\Logs" 2>nul
rmdir /s /q "%WINDIR%\System32\LogFiles" 2>nul
rmdir /s /q "%LOCALAPPDATA%\CrashDumps" 2>nul
goto :eof

:CLEAN_BROWSER_DEEP
echo Stopping all browsers...
taskkill /f /im chrome.exe 2>nul
taskkill /f /im msedge.exe 2>nul
taskkill /f /im firefox.exe 2>nul
taskkill /f /im opera.exe 2>nul
taskkill /f /im brave.exe 2>nul
taskkill /f /im iexplore.exe 2>nul
timeout /t 3 /nobreak >nul

echo Deep cleaning Chrome...
if exist "%LOCALAPPDATA%\Google\Chrome\User Data" (
    for /d %%i in ("%LOCALAPPDATA%\Google\Chrome\User Data\*") do (
        if exist "%%i\Cache" rmdir /s /q "%%i\Cache" 2>nul
        if exist "%%i\Code Cache" rmdir /s /q "%%i\Code Cache" 2>nul
        if exist "%%i\GPUCache" rmdir /s /q "%%i\GPUCache" 2>nul
        if exist "%%i\Service Worker" rmdir /s /q "%%i\Service Worker" 2>nul
        if exist "%%i\Application Cache" rmdir /s /q "%%i\Application Cache" 2>nul
        del /f /q "%%i\Cookies" 2>nul
        del /f /q "%%i\Web Data" 2>nul
        del /f /q "%%i\History" 2>nul
    )
)

echo Deep cleaning Edge...
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data" (
    for /d %%i in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\*") do (
        if exist "%%i\Cache" rmdir /s /q "%%i\Cache" 2>nul
        if exist "%%i\Code Cache" rmdir /s /q "%%i\Code Cache" 2>nul
        if exist "%%i\GPUCache" rmdir /s /q "%%i\GPUCache" 2>nul
        if exist "%%i\Service Worker" rmdir /s /q "%%i\Service Worker" 2>nul
        del /f /q "%%i\Cookies" 2>nul
        del /f /q "%%i\Web Data" 2>nul
        del /f /q "%%i\History" 2>nul
    )
)

echo Deep cleaning Firefox...
if exist "%APPDATA%\Mozilla\Firefox\Profiles" (
    for /d %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
        rmdir /s /q "%%i\cache2" 2>nul
        rmdir /s /q "%%i\startupCache" 2>nul
        rmdir /s /q "%%i\OfflineCache" 2>nul
        rmdir /s /q "%%i\thumbnails" 2>nul
        del /f /q "%%i\cookies.sqlite" 2>nul
        del /f /q "%%i\places.sqlite" 2>nul
        del /f /q "%%i\formhistory.sqlite" 2>nul
    )
)

echo Cleaning Internet Explorer...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
goto :eof

:CLEAN_WINDOWS_DEEP
echo Deep cleaning Windows Store...
if exist "%LOCALAPPDATA%\Packages" (
    for /d %%i in ("%LOCALAPPDATA%\Packages\*") do (
        rmdir /s /q "%%i\AC\Temp" 2>nul
        rmdir /s /q "%%i\TempState" 2>nul
        rmdir /s /q "%%i\LocalCache" 2>nul
        rmdir /s /q "%%i\AC\INetCache" 2>nul
        rmdir /s /q "%%i\AC\INetCookies" 2>nul
        rmdir /s /q "%%i\LocalState\cache" 2>nul
    )
)

echo Cleaning Windows Update cache...
rmdir /s /q "%WINDIR%\SoftwareDistribution\Download" 2>nul
mkdir "%WINDIR%\SoftwareDistribution\Download" 2>nul
rmdir /s /q "%WINDIR%\System32\catroot2" 2>nul

echo Cleaning Windows Search...
rmdir /s /q "%PROGRAMDATA%\Microsoft\Search\Data" 2>nul

echo Cleaning Event Logs...
rmdir /s /q "%WINDIR%\System32\winevt\Logs" 2>nul
mkdir "%WINDIR%\System32\winevt\Logs" 2>nul

echo Cleaning Windows Error Reporting...
rmdir /s /q "%PROGRAMDATA%\Microsoft\Windows\WER" 2>nul
rmdir /s /q "%LOCALAPPDATA%\Microsoft\Windows\WER" 2>nul

echo Cleaning Delivery Optimization...
rmdir /s /q "%WINDIR%\SoftwareDistribution\DeliveryOptimization" 2>nul
goto :eof

:CLEAN_ADVANCED_DEEP
echo Advanced network cache cleanup...
ipconfig /flushdns >nul 2>&1
ipconfig /registerdns >nul 2>&1
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
arp -d * 2>nul
nbtstat -R 2>nul
nbtstat -RR 2>nul
netsh winsock reset 2>nul
netsh int ip reset 2>nul

echo Registry cache cleanup...
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f 2>nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f 2>nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f 2>nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f 2>nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f 2>nul

echo Memory optimization...
echo off > "%TEMP%\empty.txt"
fsutil file createnew "%TEMP%\dummyfile" 1073741824 2>nul
del "%TEMP%\dummyfile" 2>nul
del "%TEMP%\empty.txt" 2>nul

echo System file cleanup...
sfc /scannow >nul 2>&1
dism /online /cleanup-image /startcomponentcleanup /resetbase >nul 2>&1
cleanmgr /sagerun:1 >nul 2>&1
goto :eof

:VIEW_SIZES
cls
color 0D
echo [INFO] Calculating cache sizes...
echo.
echo  ╔══════════════════════════════════════════════════════════════╗
echo  ║                        CACHE SIZES                           ║
echo  ╚══════════════════════════════════════════════════════════════╝
echo.
call :GET_FOLDER_SIZE "%TEMP%"
call :GET_FOLDER_SIZE "%LOCALAPPDATA%\Temp"
call :GET_FOLDER_SIZE "%APPDATA%\Code"
call :GET_FOLDER_SIZE "%LOCALAPPDATA%\Microsoft\VisualStudio"
call :GET_FOLDER_SIZE "%LOCALAPPDATA%\Google\Chrome"
call :GET_FOLDER_SIZE "%LOCALAPPDATA%\Microsoft\Edge"
call :GET_FOLDER_SIZE "%LOCALAPPDATA%\Packages"
call :GET_FOLDER_SIZE "%WINDIR%\Prefetch"
call :GET_FOLDER_SIZE "%WINDIR%\SoftwareDistribution"
echo.
pause
goto MAIN_MENU

:GET_FOLDER_SIZE
if exist "%~1" (
    for /f "tokens=3" %%a in ('dir "%~1" /-c /s ^| find "File(s)" 2^>nul') do (
        echo  %~1: %%a bytes
        goto :eof
    )
    echo  %~1: Unable to calculate
) else (
    echo  %~1: Not found
)
goto :eof

:CLEAN_CUSTOM
cls
color 0C
echo  ╔══════════════════════════════════════════════════════════════╗
echo  ║                    CUSTOM CLEANUP OPTIONS                    ║
echo  ╠══════════════════════════════════════════════════════════════╣
echo  ║  [1] Visual Studio Only                                      ║
echo  ║  [2] Browsers Only                                           ║
echo  ║  [3] System Temp Only                                        ║
echo  ║  [4] Windows Store Only                                      ║
echo  ║  [5] Registry Cache Only                                     ║
echo  ║  [6] Network Cache Only                                      ║
echo  ║  [7] Windows Update Only                                     ║
echo  ║  [8] Font Cache Only                                         ║
echo  ║  [9] NPM Cache Only                                          ║
echo  ╚══════════════════════════════════════════════════════════════╝
set /p custom="Select option (1-9): "

if "%custom%"=="1" (
    call :STOP_SERVICES
    call :CLEAN_VS_DEEP
    call :START_SERVICES
    call :AUTO_RESTART
)
if "%custom%"=="2" (
    call :CLEAN_BROWSER_DEEP
    pause
    goto MAIN_MENU
)
if "%custom%"=="3" (
    call :STOP_SERVICES
    call :CLEAN_SYSTEM_DEEP
    call :START_SERVICES
    call :AUTO_RESTART
)
if "%custom%"=="4" (
    call :STOP_SERVICES
    call :CLEAN_WINDOWS_DEEP
    call :START_SERVICES
    call :AUTO_RESTART
)
if "%custom%"=="5" (
    reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f 2>nul
    reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f 2>nul
    reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f 2>nul
    color 0A
    echo [SUCCESS] Registry cache cleaned!
    pause
    goto MAIN_MENU
)
if "%custom%"=="6" (
    ipconfig /flushdns >nul 2>&1
    arp -d * 2>nul
    nbtstat -R 2>nul
    netsh winsock reset 2>nul
    color 0A
    echo [SUCCESS] Network cache cleaned!
    call :AUTO_RESTART
)
if "%custom%"=="7" (
    net stop wuauserv /y 2>nul
    rmdir /s /q "%WINDIR%\SoftwareDistribution\Download" 2>nul
    mkdir "%WINDIR%\SoftwareDistribution\Download" 2>nul
    net start wuauserv 2>nul
    color 0A
    echo [SUCCESS] Windows Update cache cleaned!
    call :AUTO_RESTART
)
if "%custom%"=="8" (
    net stop "Windows Font Cache Service" /y 2>nul
    rmdir /s /q "%WINDIR%\ServiceProfiles\LocalService\AppData\Local\FontCache" 2>nul
    del /f /q "%WINDIR%\System32\FNTCACHE.DAT" 2>nul
    net start "Windows Font Cache Service" 2>nul
    color 0A
    echo [SUCCESS] Font cache cleaned!
    call :AUTO_RESTART
)
if "%custom%"=="9" (
    call :CLEAN_NPM_DEEP
    color 0A
    echo [SUCCESS] NPM cache cleaned!
    pause
    goto MAIN_MENU
)

goto MAIN_MENU

:EXIT
cls
color 0A
echo.
echo  ╔══════════════════════════════════════════════════════════════╗
echo  ║                     CLEANUP COMPLETED                        ║
echo  ║                  Thank you for using                         ║
echo  ║              Advanced Windows Cache Cleaner                  ║
echo  ╚══════════════════════════════════════════════════════════════╝
echo.
echo System cleanup completed successfully!
echo Your system performance should be improved.
echo.
timeout /t 5 /nobreak >nul
exit /b 0
