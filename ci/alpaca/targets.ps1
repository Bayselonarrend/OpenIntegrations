function Invoke-AlpacaGql([string]$Query, [hashtable]$Variables) {
    $payload = @{ query = $Query; variables = $Variables } | ConvertTo-Json -Compress -Depth 6
    $file = Join-Path $PSScriptRoot 'out\gql.json'
    Write-Utf8File $file $payload
    $raw = & gh api graphql --input $file
    if ($LASTEXITCODE -ne 0) { throw "gh api graphql failed with $LASTEXITCODE" }
    $obj = $raw | ConvertFrom-Json
    if ($obj.errors) { throw ("graphql: " + ($obj.errors | ConvertTo-Json -Compress -Depth 6)) }
    return $obj.data
}

function Test-BotEyes($groups) {
    foreach ($g in @($groups)) {
        if (-not $g) { continue }
        if ([string]$g.content -eq 'EYES' -and $g.viewerHasReacted) { return $true }
    }
    return $false
}

function Add-AlpacaStamp($bag, $node, [string]$TimeProp) {
    if (-not $node -or -not $node.body) { return }
    $raw = $node.$TimeProp
    if (-not $raw) { return }
    $login = ''
    if ($node.author -and $node.author.login) { $login = [string]$node.author.login }
    $kind = 'human'
    if ($node.body -like '*<!-- alpaca-start -->*') { $kind = 'start' }
    elseif ($node.body -like '*<!-- alpaca -->*') { $kind = 'job' }
    $bag.Add([pscustomobject]@{
        At    = [datetimeoffset]::Parse([string]$raw)
        Kind  = $kind
        Login = $login
        Id    = [string]$node.id
        Eyes  = (Test-BotEyes $node.reactionGroups)
    }) | Out-Null
}

function Get-GqlPages([string]$Query, [hashtable]$Variables, [scriptblock]$SelectPage) {
    $cursor = $null
    $all = @()
    do {
        $vars = @{}
        foreach ($key in $Variables.Keys) { $vars[$key] = $Variables[$key] }
        $vars['cursor'] = $cursor
        $data = Invoke-AlpacaGql $Query $vars
        $page = & $SelectPage $data
        if ($page -and $page.nodes) { $all += @($page.nodes) }
        $more = $false
        $cursor = $null
        if ($page -and $page.pageInfo -and $page.pageInfo.hasNextPage) {
            $more = $true
            $cursor = [string]$page.pageInfo.endCursor
        }
    } while ($more)
    return @($all | Where-Object { $_ })
}

function Get-AlpacaStamps([int]$IssueNumber, [int]$PullNumber) {
    $owner, $name = $script:Repo.Split('/')
    $bag = New-Object System.Collections.Generic.List[object]
    $issueQuery = @'
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    issue(number:$number) {
      comments(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes { id author { login } body createdAt reactionGroups { content viewerHasReacted } }
      }
    }
  }
}
'@
    $issueNodes = Get-GqlPages $issueQuery @{ owner = $owner; name = $name; number = $IssueNumber } {
        param($data) $data.repository.issue.comments
    }
    foreach ($node in $issueNodes) { Add-AlpacaStamp $bag $node 'createdAt' }

    if ($PullNumber -le 0) { return $bag }

    $prQuery = @'
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    pullRequest(number:$number) {
      comments(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes { id author { login } body createdAt reactionGroups { content viewerHasReacted } }
      }
    }
  }
}
'@
    $prNodes = Get-GqlPages $prQuery @{ owner = $owner; name = $name; number = $PullNumber } {
        param($data) $data.repository.pullRequest.comments
    }
    foreach ($node in $prNodes) { Add-AlpacaStamp $bag $node 'createdAt' }

    $reviewQuery = @'
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    pullRequest(number:$number) {
      reviews(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes { id author { login } body submittedAt reactionGroups { content viewerHasReacted } }
      }
    }
  }
}
'@
    $reviews = Get-GqlPages $reviewQuery @{ owner = $owner; name = $name; number = $PullNumber } {
        param($data) $data.repository.pullRequest.reviews
    }
    foreach ($node in $reviews) { Add-AlpacaStamp $bag $node 'submittedAt' }

    $threadQuery = @'
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    pullRequest(number:$number) {
      reviewThreads(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes {
          comments(first:100) {
            nodes { id author { login } body createdAt reactionGroups { content viewerHasReacted } }
          }
        }
      }
    }
  }
}
'@
    $threads = Get-GqlPages $threadQuery @{ owner = $owner; name = $name; number = $PullNumber } {
        param($data) $data.repository.pullRequest.reviewThreads
    }
    foreach ($thread in $threads) {
        if (-not $thread.comments) { continue }
        foreach ($node in @($thread.comments.nodes)) { Add-AlpacaStamp $bag $node 'createdAt' }
    }
    return $bag
}

function Add-Eyes([string]$SubjectId) {
    $query = 'mutation($id:ID!){ addReaction(input:{subjectId:$id, content:EYES}) { reaction { content } } }'
    $null = Invoke-AlpacaGql $query @{ id = $SubjectId }
}
