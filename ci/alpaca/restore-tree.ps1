$ErrorActionPreference = 'Continue'
& git checkout -f -- .
& git clean -fd -e /ci/alpaca/out -e ci/alpaca/out
exit 0
