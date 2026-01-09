@echo off
REM Claude Code Configuration Installer for Windows
REM This script copies custom slash commands and prompts to %USERPROFILE%\.claude\

setlocal enabledelayedexpansion

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

REM Target directory
set "CLAUDE_DIR=%USERPROFILE%\.claude"

echo.
echo === Claude Code Configuration Installer ===
echo.

REM Create target directories if they don't exist
echo Creating target directories...
if not exist "%CLAUDE_DIR%\commands" mkdir "%CLAUDE_DIR%\commands"
if not exist "%CLAUDE_DIR%\prompt" mkdir "%CLAUDE_DIR%\prompt"

REM Copy commands
echo.
echo Copying custom slash commands...
if exist "%SCRIPT_DIR%\commands" (
    for %%f in ("%SCRIPT_DIR%\commands\*.md") do (
        if /i not "%%~nxf"=="README.md" (
            copy /Y "%%f" "%CLAUDE_DIR%\commands\" >nul 2>&1
            if !errorlevel! equ 0 (
                echo [OK] Copied command: %%~nxf
            ) else (
                echo [FAIL] Failed to copy: %%~nxf
            )
        )
    )
) else (
    echo [WARN] No commands directory found
)

REM Copy prompts
echo.
echo Copying prompt files...
if exist "%SCRIPT_DIR%\prompt" (
    xcopy /E /I /Y /Q "%SCRIPT_DIR%\prompt\*" "%CLAUDE_DIR%\prompt\" >nul 2>&1
    if !errorlevel! equ 0 (
        echo [OK] Copied all prompt files
        REM List what was copied
        for /r "%SCRIPT_DIR%\prompt" %%f in (*) do (
            set "filepath=%%f"
            set "relpath=!filepath:%SCRIPT_DIR%\prompt\=!"
            echo [OK] Copied prompt: !relpath!
        )
    ) else (
        echo [FAIL] Failed to copy prompt files
    )
) else (
    echo [WARN] No prompt directory found
)

echo.
echo === Installation Complete ===
echo Commands installed to: %CLAUDE_DIR%\commands\
echo Prompts installed to: %CLAUDE_DIR%\prompt\
echo.
echo Note: Restart Claude Code or reload your configuration to use the new commands.
echo.

pause
