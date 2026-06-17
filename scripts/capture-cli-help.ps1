<#
.SYNOPSIS
  Capture GitHub Copilot CLI help output for use in slide content.

.DESCRIPTION
  Runs various `copilot` help and --help commands and saves the raw text output
  to structured .txt files under scripts/cli-capture/.
  These files are the source of truth for slide TerminalFrame content.

.OUTPUTS
  scripts/cli-capture/
    main-help.txt           copilot --help
    interactive-commands.txt  copilot help commands   (the "?" menu)
    help-config.txt         copilot help config
    help-permissions.txt    copilot help permissions
    help-environment.txt    copilot help environment
    help-providers.txt      copilot help providers
    cmd-init.txt            copilot init --help
    cmd-login.txt           copilot login --help
    cmd-plugin.txt          copilot plugin --help
    cmd-update.txt          copilot update --help
    cmd-version.txt         copilot version --help

.NOTES
  Run from the repository root:
    .\scripts\capture-cli-help.ps1

  Re-run any time you update the CLI to keep captures current.
  Add --diff flag to see what changed vs the last capture.
#>

[CmdletBinding()]
param(
    [switch]$Diff
)

$OutputDir = Join-Path $PSScriptRoot 'cli-capture'
$null = New-Item -ItemType Directory -Force -Path $OutputDir

# ── Capture targets ──────────────────────────────────────────────────────────
# Each entry: @{ Name = "filename-no-ext"; Args = @('copilot','arg1',...) }
$targets = @(
    @{ Name = 'main-help'; Args = @('copilot', '--help', '--no-color') }
    @{ Name = 'interactive-commands'; Args = @('copilot', 'help', 'commands', '--no-color') }
    @{ Name = 'help-config'; Args = @('copilot', 'help', 'config', '--no-color') }
    @{ Name = 'help-permissions'; Args = @('copilot', 'help', 'permissions', '--no-color') }
    @{ Name = 'help-environment'; Args = @('copilot', 'help', 'environment', '--no-color') }
    @{ Name = 'help-logging'; Args = @('copilot', 'help', 'logging', '--no-color') }
    @{ Name = 'help-providers'; Args = @('copilot', 'help', 'providers', '--no-color') }
    @{ Name = 'cmd-init'; Args = @('copilot', 'init', '--help', '--no-color') }
    @{ Name = 'cmd-login'; Args = @('copilot', 'login', '--help', '--no-color') }
    @{ Name = 'cmd-plugin'; Args = @('copilot', 'plugin', '--help', '--no-color') }
    @{ Name = 'cmd-update'; Args = @('copilot', 'update', '--help', '--no-color') }
    @{ Name = 'cmd-version'; Args = @('copilot', 'version', '--help', '--no-color') }
)

# ── Run & save ───────────────────────────────────────────────────────────────
$results = @()

foreach ($t in $targets) {
    $outFile = Join-Path $OutputDir "$($t.Name).txt"

    Write-Host "  Capturing $($t.Name)..." -ForegroundColor Cyan

    try {
        # Capture both stdout and stderr; strip ANSI escape codes
        $exe = $t.Args[0]
        $params = [string[]]($t.Args | Select-Object -Skip 1)
        $raw = & $exe @params 2>&1 |
        ForEach-Object { $_ -replace '\x1B\[[0-9;]*[mGKHF]', '' } |
        Out-String

        # Trim trailing blank lines
        $trimmed = $raw.TrimEnd()

        if ($Diff -and (Test-Path $outFile)) {
            $existing = Get-Content $outFile -Raw
            if ($existing.TrimEnd() -ne $trimmed) {
                Write-Host "    CHANGED: $($t.Name)" -ForegroundColor Yellow
                # NOTE: do not assign to $diff — it collides with the [switch]$Diff
                # parameter (PowerShell variables are case-insensitive), which would
                # throw "Cannot convert ... to SwitchParameter".
                $differences = Compare-Object ($existing -split "`n") ($trimmed -split "`n")
                $differences | ForEach-Object {
                    $color = if ($_.SideIndicator -eq '=>') { 'Green' } else { 'Red' }
                    Write-Host "    $($_.SideIndicator) $($_.InputObject)" -ForegroundColor $color
                }
            }
            else {
                Write-Host "    unchanged" -ForegroundColor DarkGray
            }
        }

        Set-Content -Path $outFile -Value $trimmed -Encoding UTF8
        $results += [PSCustomObject]@{ Name = $t.Name; Status = 'OK'; Lines = ($trimmed -split "`n").Count }
    }
    catch {
        Write-Warning "  Failed to capture $($t.Name): $_"
        $results += [PSCustomObject]@{ Name = $t.Name; Status = 'ERROR'; Lines = 0 }
    }
}

# ── Summary ──────────────────────────────────────────────────────────────────
Write-Host ''
Write-Host 'Capture complete' -ForegroundColor Green
$results | Format-Table -AutoSize

Write-Host "Output: $OutputDir" -ForegroundColor DarkGray
Write-Host ''
Write-Host 'Next steps:' -ForegroundColor Yellow
Write-Host '  1. Review files in scripts/cli-capture/'
Write-Host '  2. Copy relevant sections into slide TerminalFrame :lines arrays'
Write-Host '  3. Use line types: header | command | flag | example | dim | error | success'
