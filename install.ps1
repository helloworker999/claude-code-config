# Claude Code Configuration Installer for Windows (PowerShell)
# This script copies custom slash commands and prompts to ~/.claude/

# Colors for output
$Green = "Green"
$Blue = "Cyan"
$Yellow = "Yellow"
$Red = "Red"

# Get the directory where this script is located
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Target directory
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"

Write-Host ""
Write-Host "=== Claude Code Configuration Installer ===" -ForegroundColor $Blue
Write-Host ""

# Create target directories if they don't exist
Write-Host "Creating target directories..." -ForegroundColor $Yellow
$CommandsDir = Join-Path $ClaudeDir "commands"
$PromptDir = Join-Path $ClaudeDir "prompt"

if (-not (Test-Path $CommandsDir)) {
    New-Item -ItemType Directory -Path $CommandsDir -Force | Out-Null
}
if (-not (Test-Path $PromptDir)) {
    New-Item -ItemType Directory -Path $PromptDir -Force | Out-Null
}

# Copy commands
Write-Host ""
Write-Host "Copying custom slash commands..." -ForegroundColor $Yellow
$SourceCommandsDir = Join-Path $ScriptDir "commands"

if (Test-Path $SourceCommandsDir) {
    Get-ChildItem -Path $SourceCommandsDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" } | ForEach-Object {
        try {
            Copy-Item -Path $_.FullName -Destination $CommandsDir -Force
            Write-Host "[" -NoNewline
            Write-Host "OK" -ForegroundColor $Green -NoNewline
            Write-Host "] Copied command: $($_.Name)"
        }
        catch {
            Write-Host "[" -NoNewline
            Write-Host "FAIL" -ForegroundColor $Red -NoNewline
            Write-Host "] Failed to copy: $($_.Name)"
        }
    }
}
else {
    Write-Host "[" -NoNewline
    Write-Host "WARN" -ForegroundColor $Yellow -NoNewline
    Write-Host "] No commands directory found"
}

# Copy prompts (preserving directory structure)
Write-Host ""
Write-Host "Copying prompt files..." -ForegroundColor $Yellow
$SourcePromptDir = Join-Path $ScriptDir "prompt"

if (Test-Path $SourcePromptDir) {
    try {
        # Copy entire prompt directory structure
        Copy-Item -Path "$SourcePromptDir\*" -Destination $PromptDir -Recurse -Force

        # List what was copied
        Get-ChildItem -Path $SourcePromptDir -Recurse -File | ForEach-Object {
            $relativePath = $_.FullName.Substring($SourcePromptDir.Length + 1)
            Write-Host "[" -NoNewline
            Write-Host "OK" -ForegroundColor $Green -NoNewline
            Write-Host "] Copied prompt: $relativePath"
        }
    }
    catch {
        Write-Host "[" -NoNewline
        Write-Host "FAIL" -ForegroundColor $Red -NoNewline
        Write-Host "] Failed to copy prompt files"
    }
}
else {
    Write-Host "[" -NoNewline
    Write-Host "WARN" -ForegroundColor $Yellow -NoNewline
    Write-Host "] No prompt directory found"
}

Write-Host ""
Write-Host "=== Installation Complete ===" -ForegroundColor $Green
Write-Host "Commands installed to: " -NoNewline
Write-Host $CommandsDir -ForegroundColor $Blue
Write-Host "Prompts installed to: " -NoNewline
Write-Host $PromptDir -ForegroundColor $Blue
Write-Host ""
Write-Host "Note: " -NoNewline -ForegroundColor $Yellow
Write-Host "Restart Claude Code or reload your configuration to use the new commands."
Write-Host ""

# Pause if running in interactive mode
if ($Host.Name -eq "ConsoleHost") {
    Write-Host "Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
