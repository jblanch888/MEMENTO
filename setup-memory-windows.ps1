<#
.SYNOPSIS
    Configure le serveur MCP Memory officiel pour Claude Desktop sur Windows.

.DESCRIPTION
    Ce script :
    1. Vérifie que Node.js est installé
    2. Crée le dossier de mémoire persistante
    3. Configure Claude Desktop pour utiliser le MCP server-memory
    4. Explique comment vérifier que ça marche

.NOTES
    Pour Stéphanie — setup mémoire persistante
#>

# --- Helpers ---
function Write-Step {
    param([string]$Message)
    Write-Host "`n  [>] $Message" -ForegroundColor Yellow
}

function Write-OK {
    param([string]$Message)
    Write-Host "  [OK] $Message" -ForegroundColor Green
}

function Write-Err {
    param([string]$Message)
    Write-Host "  [X] $Message" -ForegroundColor Red
}

# --- Banner ---
Write-Host ""
Write-Host "  =============================================" -ForegroundColor Magenta
Write-Host "    Setup Memoire Persistante - Claude Desktop"  -ForegroundColor Magenta
Write-Host "  =============================================" -ForegroundColor Magenta

# --- Step 1: Check Node.js ---
Write-Step "Verification de Node.js..."

$nodePath = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodePath) {
    Write-Err "Node.js n'est pas installe."
    Write-Host "  Telecharge-le ici : https://nodejs.org/" -ForegroundColor Gray
    Write-Host "  Prends la version LTS (bouton vert)." -ForegroundColor Gray
    Write-Host "  Redemarre ton terminal apres l'installation." -ForegroundColor Gray
    exit 1
}

$nodeVersion = node --version
Write-OK "Node.js $nodeVersion detecte"

# --- Step 2: Create memory directory ---
Write-Step "Creation du dossier memoire..."

$memoryDir = Join-Path $env:USERPROFILE ".claude-memory"
if (-not (Test-Path $memoryDir)) {
    New-Item -ItemType Directory -Path $memoryDir -Force | Out-Null
    Write-OK "Dossier cree : $memoryDir"
}
else {
    Write-OK "Dossier existe deja : $memoryDir"
}

# --- Step 3: Configure Claude Desktop ---
Write-Step "Configuration de Claude Desktop..."

$claudeConfigDir = Join-Path $env:APPDATA "Claude"
$claudeConfigFile = Join-Path $claudeConfigDir "claude_desktop_config.json"

# Read existing config or create new
$config = @{}
if (Test-Path $claudeConfigFile) {
    try {
        $existingContent = Get-Content $claudeConfigFile -Raw
        $config = $existingContent | ConvertFrom-Json -AsHashtable
        Write-Host "    Config existante trouvee, mise a jour..." -ForegroundColor Gray
    }
    catch {
        Write-Host "    Config existante illisible, creation d'une nouvelle..." -ForegroundColor Gray
        # Backup old config
        Copy-Item $claudeConfigFile "$claudeConfigFile.bak" -Force
    }
}
else {
    if (-not (Test-Path $claudeConfigDir)) {
        New-Item -ItemType Directory -Path $claudeConfigDir -Force | Out-Null
    }
}

# Ensure mcpServers key exists
if (-not $config.ContainsKey("mcpServers")) {
    $config["mcpServers"] = @{}
}

# Memory file path (escaped for JSON)
$memoryFilePath = Join-Path $memoryDir "memory.jsonl"

# Add memory server config
$config["mcpServers"]["memory"] = @{
    command = "npx"
    args    = @("-y", "@modelcontextprotocol/server-memory")
    env     = @{
        MEMORY_FILE_PATH = $memoryFilePath
    }
}

# Write config
$jsonContent = $config | ConvertTo-Json -Depth 10
Set-Content -Path $claudeConfigFile -Value $jsonContent -Encoding UTF8

Write-OK "Config Claude Desktop mise a jour"
Write-Host "    Fichier : $claudeConfigFile" -ForegroundColor Gray

# --- Step 4: Test npx ---
Write-Step "Verification de npx..."

$npxPath = Get-Command npx -ErrorAction SilentlyContinue
if ($npxPath) {
    Write-OK "npx disponible"
}
else {
    Write-Err "npx non trouve (installe normalement avec Node.js)"
}

# --- Summary ---
Write-Host ""
Write-Host "  =============================================" -ForegroundColor Green
Write-Host "    Configuration terminee !" -ForegroundColor Green
Write-Host "  =============================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Memoire stockee dans :" -ForegroundColor White
Write-Host "    $memoryFilePath" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Pour activer :" -ForegroundColor White
Write-Host "    1. Redemarre Claude Desktop" -ForegroundColor Gray
Write-Host "    2. Dans une conversation, Claude aura acces aux outils :" -ForegroundColor Gray
Write-Host "       - create_entities    (creer des entites en memoire)" -ForegroundColor Yellow
Write-Host "       - create_relations   (creer des liens entre entites)" -ForegroundColor Yellow
Write-Host "       - add_observations   (ajouter des observations)" -ForegroundColor Yellow
Write-Host "       - search_nodes       (chercher dans la memoire)" -ForegroundColor Yellow
Write-Host "       - open_nodes         (ouvrir des entites specifiques)" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Pour tester :" -ForegroundColor White
Write-Host "    Dis a Claude : 'Sauvegarde en memoire que je m'appelle Stephanie'" -ForegroundColor Yellow
Write-Host "    Puis dans une NOUVELLE conversation : 'Comment je m'appelle ?'" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Le graphe de connaissances va grandir au fil des sessions." -ForegroundColor Gray
Write-Host "  Claude pourra y stocker les entites, relations et observations" -ForegroundColor Gray
Write-Host "  de votre relation automatiquement." -ForegroundColor Gray
Write-Host ""
