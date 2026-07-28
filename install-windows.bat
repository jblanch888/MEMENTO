@echo off
REM =============================================
REM  MEMENTO - Windows Quick Installer
REM  Double-click this file to start installation
REM =============================================

echo.
echo   MEMENTO - Framework for AI-Assisted Development
echo   Starting installation...
echo.

REM Check if PowerShell is available
where powershell >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo   [ERROR] PowerShell is not available on this system.
    echo   Please install PowerShell from https://aka.ms/powershell
    pause
    exit /b 1
)

REM Run the PowerShell installer with bypass policy for this script only
powershell -ExecutionPolicy Bypass -File "%~dp0install-windows.ps1"

echo.
pause
