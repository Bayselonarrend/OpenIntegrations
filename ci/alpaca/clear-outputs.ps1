Remove-Item -Force -ErrorAction SilentlyContinue @(
    (Join-Path $PSScriptRoot 'out\comment.md'),
    (Join-Path $PSScriptRoot 'out\verdict.txt'),
    (Join-Path $PSScriptRoot 'out\test-job.txt')
)
exit 0
