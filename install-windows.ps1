<#
.SYNOPSIS
    MEMENTO Framework - Windows Installation Script

.DESCRIPTION
    Installs and configures the MEMENTO framework for AI-assisted development on Windows.
    This script:
      1. Checks prerequisites (Git, optionally Docker)
      2. Clones the MEMENTO repository into a project directory of your choice
      3. Initializes the memory prosthesis files for your project
      4. Optionally configures Claude Code settings

.NOTES
    Author:  MEMENTO Contributors
    License: MIT
    Requires: Windows 10/11, PowerShell 5.1+, Git

.EXAMPLE
    .\install-windows.ps1
    # Interactive installation with prompts

.EXAMPLE
    .\install-windows.ps1 -ProjectPath "C:\Dev\my-project-memento"
    # Install directly to the specified path
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$ProjectPath,

    [Parameter(Mandatory = $false)]
    [switch]$SkipDocker
)

# --- Configuration ---
$MementoRepo = "https://github.com/jblanch888/MEMENTO.git"
$MinGitVersion = [version]"2.0.0"

# --- Helpers ---
function Write-Banner {
    Write-Host ""
    Write-Host "  =============================================" -ForegroundColor Cyan
    Write-Host "    MEMENTO - Framework for AI-Assisted Dev"     -ForegroundColor Cyan
    Write-Host "    Windows Installer"                           -ForegroundColor Cyan
    Write-Host "  =============================================" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Step {
    param([string]$Message)
    Write-Host "  [>] $Message" -ForegroundColor Yellow
}

function Write-OK {
    param([string]$Message)
    Write-Host "  [OK] $Message" -ForegroundColor Green
}

function Write-Warn {
    param([string]$Message)
    Write-Host "  [!] $Message" -ForegroundColor DarkYellow
}

function Write-Err {
    param([string]$Message)
    Write-Host "  [X] $Message" -ForegroundColor Red
}

function Test-CommandExists {
    param([string]$Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

# --- Main ---
Write-Banner

# -------------------------------------------------------
# Step 1: Check prerequisites
# -------------------------------------------------------
Write-Step "Checking prerequisites..."

# PowerShell version
if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Err "PowerShell 5.1 or later is required. You have $($PSVersionTable.PSVersion)."
    Write-Host "  Download from: https://aka.ms/powershell" -ForegroundColor Gray
    exit 1
}
Write-OK "PowerShell $($PSVersionTable.PSVersion)"

# Git
if (-not (Test-CommandExists "git")) {
    Write-Err "Git is not installed or not in PATH."
    Write-Host ""
    Write-Host "  Install Git for Windows:" -ForegroundColor Gray
    Write-Host "    1. Go to https://git-scm.com/download/win" -ForegroundColor Gray
    Write-Host "    2. Download and run the installer" -ForegroundColor Gray
    Write-Host "    3. Use the default options (make sure 'Git from the command line' is selected)" -ForegroundColor Gray
    Write-Host "    4. Restart this terminal and run this script again" -ForegroundColor Gray
    Write-Host ""
    exit 1
}

$gitVersionRaw = (git --version) -replace "git version ", ""
# Handle versions like "2.43.0.windows.1"
$gitVersionClean = ($gitVersionRaw -split "\.windows")[0]
try {
    $gitVersion = [version]$gitVersionClean
    if ($gitVersion -lt $MinGitVersion) {
        Write-Warn "Git $gitVersionRaw detected. Version $MinGitVersion+ is recommended."
    }
    else {
        Write-OK "Git $gitVersionRaw"
    }
}
catch {
    Write-OK "Git $gitVersionRaw (version check skipped)"
}

# Docker (optional)
if (-not $SkipDocker) {
    if (Test-CommandExists "docker") {
        Write-OK "Docker detected (optional - for HelioVantage demo)"
    }
    else {
        Write-Warn "Docker not found (optional - only needed for the HelioVantage demo)"
        Write-Host "    Install from https://www.docker.com/products/docker-desktop/ if you want to run the demo." -ForegroundColor Gray
    }
}

Write-Host ""

# -------------------------------------------------------
# Step 2: Choose installation directory
# -------------------------------------------------------
Write-Step "Setting up installation directory..."

if (-not $ProjectPath) {
    $defaultPath = Join-Path $HOME "memento-project"
    Write-Host ""
    Write-Host "  Where would you like to install MEMENTO?" -ForegroundColor White
    Write-Host "  Press Enter to use the default: $defaultPath" -ForegroundColor Gray
    $userInput = Read-Host "  Path"

    if ([string]::IsNullOrWhiteSpace($userInput)) {
        $ProjectPath = $defaultPath
    }
    else {
        $ProjectPath = $userInput.Trim('"').Trim("'")
    }
}

# Resolve to absolute path
$ProjectPath = [System.IO.Path]::GetFullPath($ProjectPath)

if (Test-Path $ProjectPath) {
    $items = Get-ChildItem -Path $ProjectPath -Force
    if ($items.Count -gt 0) {
        Write-Warn "Directory '$ProjectPath' already exists and is not empty."
        $overwrite = Read-Host "  Continue anyway? (y/N)"
        if ($overwrite -notmatch "^[yY]") {
            Write-Host "  Installation cancelled." -ForegroundColor Gray
            exit 0
        }
    }
}

Write-OK "Installation directory: $ProjectPath"
Write-Host ""

# -------------------------------------------------------
# Step 3: Clone the repository
# -------------------------------------------------------
Write-Step "Cloning MEMENTO repository..."

try {
    if (Test-Path (Join-Path $ProjectPath ".git")) {
        Write-Warn "Git repository already exists at $ProjectPath. Pulling latest changes..."
        Push-Location $ProjectPath
        git pull origin main 2>&1 | Out-Null
        Pop-Location
        Write-OK "Repository updated."
    }
    else {
        git clone $MementoRepo $ProjectPath 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            throw "git clone failed with exit code $LASTEXITCODE"
        }
        Write-OK "Repository cloned successfully."
    }
}
catch {
    Write-Err "Failed to clone repository: $_"
    Write-Host "  Make sure you have internet connectivity and Git is properly configured." -ForegroundColor Gray
    exit 1
}

Write-Host ""

# -------------------------------------------------------
# Step 4: Initialize memory prosthesis files
# -------------------------------------------------------
Write-Step "Initializing memory prosthesis..."

$currentFocusPath = Join-Path $ProjectPath "memory-prosthesis\working-context\CURRENT_FOCUS.md"
$statusPath = Join-Path $ProjectPath "memory-prosthesis\working-context\STATUS.md"
$archPrinciplesPath = Join-Path $ProjectPath "memory-prosthesis\active-knowledge\ARCHITECTURE_PRINCIPLES.md"

# Only write default content if files look like templates (not yet customized)
function Initialize-FileIfTemplate {
    param(
        [string]$FilePath,
        [string]$TemplateMarker,
        [string]$DefaultContent,
        [string]$Label
    )

    if (Test-Path $FilePath) {
        $content = Get-Content $FilePath -Raw -ErrorAction SilentlyContinue
        if ($content -match $TemplateMarker) {
            Write-Host "    $Label is still a template - ready for customization." -ForegroundColor Gray
        }
        else {
            Write-Host "    $Label already customized - skipping." -ForegroundColor Gray
        }
    }
}

Initialize-FileIfTemplate `
    -FilePath $currentFocusPath `
    -TemplateMarker "TEMPLATE" `
    -Label "CURRENT_FOCUS.md"

Initialize-FileIfTemplate `
    -FilePath $archPrinciplesPath `
    -TemplateMarker "TEMPLATE" `
    -Label "ARCHITECTURE_PRINCIPLES.md"

Write-OK "Memory prosthesis structure is ready."
Write-Host ""

# -------------------------------------------------------
# Step 5: Configure line endings for Windows
# -------------------------------------------------------
Write-Step "Configuring Git for Windows compatibility..."

Push-Location $ProjectPath
git config core.autocrlf true 2>&1 | Out-Null
Pop-Location

Write-OK "Git line endings configured (autocrlf = true)"
Write-Host ""

# -------------------------------------------------------
# Step 6: Summary
# -------------------------------------------------------
Write-Host ""
Write-Host "  =============================================" -ForegroundColor Green
Write-Host "    Installation complete!" -ForegroundColor Green
Write-Host "  =============================================" -ForegroundColor Green
Write-Host ""
Write-Host "  MEMENTO installed at:" -ForegroundColor White
Write-Host "    $ProjectPath" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor White
Write-Host "    1. Open the project folder in your editor (VS Code recommended)" -ForegroundColor Gray
Write-Host "       code `"$ProjectPath`"" -ForegroundColor Yellow
Write-Host ""
Write-Host "    2. Customize your architecture principles:" -ForegroundColor Gray
Write-Host "       $archPrinciplesPath" -ForegroundColor Yellow
Write-Host ""
Write-Host "    3. Set your current focus:" -ForegroundColor Gray
Write-Host "       $currentFocusPath" -ForegroundColor Yellow
Write-Host ""
Write-Host "    4. Read the Field Guide for detailed instructions:" -ForegroundColor Gray
Write-Host "       $(Join-Path $ProjectPath 'MEMENTO_FIELD_GUIDE.md')" -ForegroundColor Yellow
Write-Host ""
Write-Host "    5. (Optional) Run the HelioVantage demo:" -ForegroundColor Gray
Write-Host "       docker run -d -p 8090:8090 jblanch888/heliovantage-demo:latest" -ForegroundColor Yellow
Write-Host "       Then visit http://localhost:8090" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Documentation:" -ForegroundColor White
Write-Host "    - Field Guide:   MEMENTO_FIELD_GUIDE.md" -ForegroundColor Gray
Write-Host "    - Core Rules:    protocols\CORE_DIRECTIVES.md" -ForegroundColor Gray
Write-Host "    - Playbooks:     protocols\playbooks\" -ForegroundColor Gray
Write-Host ""
Write-Host "  Happy building with MEMENTO!" -ForegroundColor Cyan
Write-Host ""
