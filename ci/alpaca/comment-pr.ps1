param(
    [Parameter(Mandatory = $true)][string]$BodyFile,
    [ValidateSet('pr', 'issue')][string]$Target = 'pr'
)

. (Join-Path $PSScriptRoot 'common.ps1')
$ErrorActionPreference = 'Stop'

if (-not (Test-Path $BodyFile)) { throw "Comment file not found: $BodyFile" }
$targetArgs = @()
if ($Target -eq 'issue') {
    $issue = $env:ALPACA_ISSUE
    if ($issue -notmatch '^[0-9]+$') { throw "Bad ALPACA_ISSUE: $issue" }
    $targetArgs = @('issue', 'comment', $issue)
} else {
    $pr = (Read-Utf8File (Join-Path $PSScriptRoot 'out\pr.txt')).Trim()
    if ($pr -notmatch '^[0-9]+$') { throw "Bad PR number: $pr" }
    $targetArgs = @('pr', 'comment', $pr)
}

$text = Read-Utf8File $BodyFile
if ($text -notlike '*<!-- alpaca -->*') {
    $text = "<!-- alpaca -->`r`n`r`n$text"
}
if ($text.Length -gt 60000) {
    $text = $text.Substring(0, 60000) + "`r`n..."
}
$post = Join-Path $PSScriptRoot 'out\comment-post.md'
Write-Utf8File $post $text
& gh @targetArgs --repo $script:Repo --body-file $post
exit $LASTEXITCODE
