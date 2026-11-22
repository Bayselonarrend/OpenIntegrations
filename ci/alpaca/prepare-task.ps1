param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('edit', 'write-tests', 'explain-build', 'pick-tests', 'judge-tests')]
    [string]$Mode
)

. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

$issue = $env:ALPACA_ISSUE
if ($issue -notmatch '^[0-9]+$') { throw "Bad ALPACA_ISSUE: $issue" }
$outDir = Join-Path $PSScriptRoot 'out'
$prPath = Join-Path $outDir 'pr.txt'
$pr = if (Test-Path $prPath) { (Read-Utf8File $prPath).Trim() } else { '' }

function Limit-Text([string]$Text, [int]$MaxLines) {
    if (-not $Text) { return '' }
    $lines = @($Text -split "`r?`n")
    if ($lines.Length -le $MaxLines) { return $Text }
    return (($lines | Select-Object -First $MaxLines) -join "`n") + "`n..."
}

function Get-Login($item) {
    if ($item.author -and $item.author.login) { return [string]$item.author.login }
    if ($item.user -and $item.user.login) { return [string]$item.user.login }
    return 'unknown'
}

function Get-Role($item, [string]$Login) {
    if ($item.body -like '*<!-- alpaca -->*' -or $item.body -like '*<!-- alpaca-start -->*') { return 'alpaca' }
    if ([string]::Equals($Login, 'bayselonarrend', [StringComparison]::OrdinalIgnoreCase)) { return 'owner' }
    return 'context'
}

function Append-Thread($sb, $heading, $items, $prop) {
    [void]$sb.AppendLine("## $heading")
    $rows = @($items | Where-Object { $_ -and $_.body })
    if ($rows.Count -eq 0) {
        [void]$sb.AppendLine('(none)')
        [void]$sb.AppendLine('')
        return
    }
    foreach ($item in ($rows | Sort-Object { $_.$prop })) {
        $who = Get-Login $item
        $role = Get-Role $item $who
        [void]$sb.AppendLine("### $who ($role) $($item.$prop)")
        [void]$sb.AppendLine($item.body.Trim())
        [void]$sb.AppendLine('')
    }
}

$promptPath = Join-Path $PSScriptRoot "prompts\$Mode.md"
$issueRaw = & gh issue view $issue --repo $script:Repo --json number,title,body,comments
if ($LASTEXITCODE -ne 0) { throw "gh issue view failed with $LASTEXITCODE" }
$issueObj = $issueRaw | ConvertFrom-Json
$prObj = $null
if ($pr -match '^[0-9]+$') {
    $prRaw = & gh pr view $pr --repo $script:Repo --json comments,reviews
    if ($LASTEXITCODE -ne 0) { throw "gh pr view failed with $LASTEXITCODE" }
    $prObj = $prRaw | ConvertFrom-Json
}

$stat = & git diff --stat origin/main HEAD
$diffOk = $LASTEXITCODE -eq 0
$names = & git diff --name-only origin/main HEAD
if (-not $diffOk -or $LASTEXITCODE -ne 0) {
    $stat = ''
    $names = ''
}

$authorityPath = Join-Path $PSScriptRoot 'prompts\authority.md'
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine((Read-Utf8File $authorityPath).TrimEnd())
[void]$sb.AppendLine('')
[void]$sb.AppendLine((Read-Utf8File $promptPath).TrimEnd())
[void]$sb.AppendLine('')
[void]$sb.AppendLine("Reason: $($env:ALPACA_REASON)")
[void]$sb.AppendLine("Cycle: $($env:ALPACA_CYCLE) of $($env:ALPACA_MAX)")
[void]$sb.AppendLine("Branch: $($env:ALPACA_BRANCH)")
[void]$sb.AppendLine('')
[void]$sb.AppendLine("## Issue $($issueObj.number)")
[void]$sb.AppendLine("### $($issueObj.title)")
[void]$sb.AppendLine('')
if ($issueObj.body) { [void]$sb.AppendLine($issueObj.body.Trim()) }
[void]$sb.AppendLine('')
Append-Thread $sb 'Issue comments' $issueObj.comments 'createdAt'
if ($prObj) {
    Append-Thread $sb 'PR comments' $prObj.comments 'createdAt'
    Append-Thread $sb 'PR reviews' $prObj.reviews 'submittedAt'
    Append-Thread $sb 'PR line comments' (Get-PullReviewComments $pr) 'created_at'
}
[void]$sb.AppendLine('## Diff against origin/main')
[void]$sb.AppendLine((Limit-Text ($stat | Out-String) 150))
[void]$sb.AppendLine((Limit-Text ($names | Out-String) 200))

if ($Mode -eq 'write-tests') {
    $pendingStatus = & git status --porcelain
    $pendingDiff = & git diff HEAD -- src/ru/BSL/OpenIntegrations
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine('## Uncommitted changes')
    [void]$sb.AppendLine((Limit-Text ($pendingStatus | Out-String) 200))
    [void]$sb.AppendLine('## Uncommitted public BSL diff')
    [void]$sb.AppendLine((Limit-Text ($pendingDiff | Out-String) 800))
}

if ($Mode -eq 'explain-build') {
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine("BigFloppa result: $($env:DOWNSTREAM_RESULT)")
    [void]$sb.AppendLine("BigFloppa url: $($env:DOWNSTREAM_URL)")
    $logPath = Join-Path $outDir 'build-log.txt'
    $logText = if (Test-Path $logPath) { Read-Utf8File $logPath } else { 'log unavailable' }
    [void]$sb.AppendLine('## Build log')
    [void]$sb.AppendLine((Limit-Text $logText 800))
}

if ($Mode -eq 'judge-tests') {
    $summaryPath = Join-Path $outDir 'tests-summary.md'
    $summary = if (Test-Path $summaryPath) { Read-Utf8File $summaryPath } else { 'summary unavailable' }
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine('## Test results')
    [void]$sb.AppendLine((Limit-Text $summary 800))
}

Write-Utf8File (Join-Path $outDir 'task.md') $sb.ToString()
Write-Output "Wrote task.md for $Mode"
exit 0
