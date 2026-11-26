-- GitHub comments, reviews and reactions used by Watch and the eye step.
return function(A)
    local json = A.json
    local M = {}

    local function gql(query, variables)
        A.mkdirs(A.out)
        local file = A.out .. "/gql.json"
        A.write(file, json.encode({ query = query, variables = variables }))
        local text, code = A.capture({ "gh", "api", "graphql", "--input", file })
        if code ~= 0 then A.die("gh api graphql failed with " .. tostring(code)) end
        local obj = A.decode(text, "gh api graphql")
        if type(obj.errors) == "table" and obj.errors ~= json.null and obj.errors[1] ~= nil then
            A.die("graphql: " .. json.encode(obj.errors))
        end
        return obj.data
    end

    local function eyes_of(groups)
        local logins = {}
        if type(groups) ~= "table" or groups == json.null then return logins end
        for _, group in ipairs(groups) do
            if type(group) == "table" and group.content == "EYES"
                and type(group.users) == "table" and type(group.users.nodes) == "table" then
                for _, user in ipairs(group.users.nodes) do
                    if type(user) == "table" and type(user.login) == "string" then
                        logins[#logins + 1] = user.login
                    end
                end
            end
        end
        return logins
    end

    local function add(bag, node, prop)
        if type(node) ~= "table" or node == json.null then return end
        if type(node.body) ~= "string" or node.body == "" then return end
        if type(node[prop]) ~= "string" or node[prop] == "" then return end
        local login = ""
        if type(node.author) == "table" and type(node.author.login) == "string" then
            login = node.author.login
        end
        local kind = "human"
        if node.body:find("<!-- alpaca-start -->", 1, true) then
            kind = "start"
        elseif node.body:find("<!-- alpaca -->", 1, true) then
            kind = "job"
        end
        bag[#bag + 1] = {
            at = node[prop],
            kind = kind,
            login = login,
            id = tostring(node.id or ""),
            body = node.body,
            eyes = eyes_of(node.reactionGroups),
        }
    end

    local function pages(query, variables, pick, what)
        local cursor = json.null
        local all = {}
        local more = true
        while more do
            local vars = {}
            for k, v in pairs(variables) do vars[k] = v end
            vars.cursor = cursor
            local data = gql(query, vars)
            local page = pick(data)
            if type(page) ~= "table" or page == json.null then
                A.die(what .. " not found")
            end
            if type(page.nodes) == "table" and page.nodes ~= json.null then
                for _, node in ipairs(page.nodes) do all[#all + 1] = node end
            end
            more = false
            cursor = json.null
            if type(page.pageInfo) == "table" and page.pageInfo.hasNextPage == true then
                more = true
                cursor = page.pageInfo.endCursor
            end
        end
        return all
    end

    local issueQuery = [[
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    issue(number:$number) {
      comments(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes { id author { login } body createdAt reactionGroups { content users(first: 10) { nodes { login } } } }
      }
    }
  }
}
]]

    local prQuery = [[
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    pullRequest(number:$number) {
      comments(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes { id author { login } body createdAt reactionGroups { content users(first: 10) { nodes { login } } } }
      }
    }
  }
}
]]

    local reviewQuery = [[
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    pullRequest(number:$number) {
      reviews(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes { id author { login } body submittedAt reactionGroups { content users(first: 10) { nodes { login } } } }
      }
    }
  }
}
]]

    local threadQuery = [[
query($owner:String!, $name:String!, $number:Int!, $cursor:String) {
  repository(owner:$owner, name:$name) {
    pullRequest(number:$number) {
      reviewThreads(first:100, after:$cursor) {
        pageInfo { hasNextPage endCursor }
        nodes {
          comments(first:100) {
            nodes { id author { login } body createdAt reactionGroups { content users(first: 10) { nodes { login } } } }
          }
        }
      }
    }
  }
}
]]

    function M.stamps(issueNumber, pullNumber)
        local owner, name = A.repo:match("^([^/]+)/([^/]+)$")
        local bag = {}
        local base = { owner = owner, name = name, number = issueNumber }
        local issueNodes = pages(issueQuery, base, function(data)
            return data.repository.issue.comments
        end, "issue")
        for _, node in ipairs(issueNodes) do add(bag, node, "createdAt") end
        if not pullNumber or pullNumber <= 0 then return bag end
        base = { owner = owner, name = name, number = pullNumber }
        local prNodes = pages(prQuery, base, function(data)
            return data.repository.pullRequest.comments
        end, "pull request")
        for _, node in ipairs(prNodes) do add(bag, node, "createdAt") end
        local reviews = pages(reviewQuery, base, function(data)
            return data.repository.pullRequest.reviews
        end, "pull request")
        for _, node in ipairs(reviews) do add(bag, node, "submittedAt") end
        local threads = pages(threadQuery, base, function(data)
            return data.repository.pullRequest.reviewThreads
        end, "pull request")
        for _, thread in ipairs(threads) do
            if type(thread) == "table" and type(thread.comments) == "table"
                and type(thread.comments.nodes) == "table" then
                for _, node in ipairs(thread.comments.nodes) do add(bag, node, "createdAt") end
            end
        end
        return bag
    end

    function M.eyes(subjectId)
        gql("mutation($id:ID!){ addReaction(input:{subjectId:$id, content:EYES}) { reaction { content } } }", {
            id = subjectId,
        })
    end

    return M
end
