@echo off
setlocal

if "%~1"=="" (
    echo Usage:
    echo   bw16 erase COMx
    echo   bw16 flash COMx
    exit /b 1
)

set ACTION=%~1
set PORT=%~2

set TOOL=upload_image_tool_windows.exe
set BOARD=bw16
set BAUD=1500000

if "%ACTION%"=="erase" (
    echo Erasing BW16 on port %PORT%...
    %TOOL% . %PORT% %BOARD% Enable Enable %BAUD%
    exit /b
)

if "%ACTION%"=="flash" (
    echo Flashing BW16 on port %PORT%...
    %TOOL% . %PORT% %BOARD% Enable Disable %BAUD%
    exit /b
)

echo Unknown action: %ACTION%
echo Use "erase" or "flash"
exit /b 1
