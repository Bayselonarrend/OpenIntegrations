local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local modes = {
    edit = true,
    ["write-tests"] = true,
    ["translate-dict"] = true,
    ["explain-build"] = true,
    ["pick-tests"] = true,
    ["judge-tests"] = true,
    review = true,
    confirm = true,
    analyze = true,
}
local mode = arg[1]
if not modes[mode] then A.die("Bad mode: " .. tostring(mode)) end

local issue = A.issue()
local prText = A.trim(A.read(A.out .. "/pr.txt") or "")
local agent = A.agent(A.env("ALPACA_AGENT"))

local function login_of(item)
    if type(item.author) == "table" and item.author ~= A.json.null and item.author.login then
        return tostring(item.author.login)
    end
    if type(item.user) == "table" and item.user ~= A.json.null and item.user.login then
        return tostring(item.user.login)
    end
    return "unknown"
end

local function peer(login)
    if type(agent.reactTo) ~= "table" then return false end
    for _, who in ipairs(agent.reactTo) do
        if not A.ieq(who, "bayselonarrend") and A.ieq(who, login) then return true end
    end
    return false
end

local function role_of(item, login)
    local body = type(item.body) == "string" and item.body or ""
    local marked = body:find("<!-- alpaca -->", 1, true) or body:find("<!-- alpaca-start -->", 1, true)
    if A.ieq(login, agent.login) and marked then return "alpaca" end
    if peer(login) then return "peer" end
    if marked then return "alpaca" end
    if A.ieq(login, "bayselonarrend") then return "owner" end
    return "context"
end

local function rows_of(items)
    local rows = {}
    if type(items) ~= "table" or items == A.json.null then return rows end
    for _, item in ipairs(items) do
        if type(item) == "table" and type(item.body) == "string" and item.body ~= "" then
            rows[#rows + 1] = item
        end
    end
    return rows
end

local function append_thread(sb, heading, items, prop)
    sb[#sb + 1] = "## " .. heading
    local rows = rows_of(items)
    if #rows == 0 then
        sb[#sb + 1] = "(none)"
        sb[#sb + 1] = ""
        return
    end
    table.sort(rows, function(a, b)
        return tostring(a[prop] or "") < tostring(b[prop] or "")
    end)
    for _, item in ipairs(rows) do
        local who = login_of(item)
        sb[#sb + 1] = "### " .. who .. " (" .. role_of(item, who) .. ") " .. tostring(item[prop] or "")
        sb[#sb + 1] = A.trim(item.body)
        sb[#sb + 1] = ""
    end
end

local function review_comments(number)
    local text, code = A.capture({
        "gh", "api", "--paginate", "repos/" .. A.repo .. "/pulls/" .. number .. "/comments",
    })
    if code ~= 0 then A.die("gh api pull comments failed with " .. tostring(code)) end
    text = A.trim(text)
    if text == "" or text == "[]" then return {} end
    local ok, value = pcall(A.json.decode, text)
    if not ok then
        local merged = text:gsub("%]%s*%[", ",")
        ok, value = pcall(A.json.decode, merged)
        if not ok then A.die("gh api pull comments returned invalid JSON") end
    end
    if type(value) ~= "table" or value == A.json.null then return {} end
    return value
end

local promptPath = A.root .. "/prompts/" .. mode .. ".md"
local agentPrompt = A.root .. "/agents/" .. agent.id .. "/prompt.md"
if not A.isfile(promptPath) then A.die("Prompt not found: " .. promptPath) end
if not A.isfile(agentPrompt) then A.die("Prompt not found: " .. agentPrompt) end

local issueObj = A.json_out({
    "gh", "issue", "view", issue, "--repo", A.repo, "--json", "number,title,body,comments",
}, "gh issue view")
local prObj = nil
if prText:match("^%d+$") then
    prObj = A.json_out({
        "gh", "pr", "view", prText, "--repo", A.repo, "--json", "comments,reviews",
    }, "gh pr view")
end

local stat, statCode = A.capture({ "git", "diff", "--stat", "origin/main", "HEAD" })
local names, namesCode = A.capture({ "git", "diff", "--name-only", "origin/main", "HEAD" })
if statCode ~= 0 or namesCode ~= 0 then
    stat, names = "", ""
end

local sb = {}
sb[#sb + 1] = A.trim(A.read(agentPrompt) or "")
sb[#sb + 1] = ""
sb[#sb + 1] = A.trim(A.read(promptPath) or "")
sb[#sb + 1] = ""
sb[#sb + 1] = "Reason: " .. A.env("ALPACA_REASON")
sb[#sb + 1] = "Cycle: " .. A.env("ALPACA_CYCLE") .. " of " .. A.env("ALPACA_MAX")
sb[#sb + 1] = "Branch: " .. A.env("ALPACA_BRANCH")
sb[#sb + 1] = ""
sb[#sb + 1] = "## Issue " .. tostring(issueObj.number)
sb[#sb + 1] = "### " .. tostring(issueObj.title or "")
sb[#sb + 1] = ""
if type(issueObj.body) == "string" and issueObj.body ~= "" then
    sb[#sb + 1] = A.trim(issueObj.body)
end
sb[#sb + 1] = ""
append_thread(sb, "Issue comments", issueObj.comments, "createdAt")
if prObj then
    append_thread(sb, "PR comments", prObj.comments, "createdAt")
    append_thread(sb, "PR reviews", prObj.reviews, "submittedAt")
    append_thread(sb, "PR line comments", review_comments(prText), "created_at")
end
sb[#sb + 1] = "## Diff against origin/main"
sb[#sb + 1] = A.limit(stat, 150)
sb[#sb + 1] = A.limit(names, 200)

if mode == "translate-dict" then
    local dict = A.decode(A.read("service/dictionaries/en.json"), "en.json")
    local empty = {}
    for key, value in pairs(dict) do
        if type(value) == "string" and A.trim(value) == "" then empty[#empty + 1] = key end
    end
    table.sort(empty)
    sb[#sb + 1] = ""
    sb[#sb + 1] = "## Empty dictionary keys"
    if #empty == 0 then
        sb[#sb + 1] = "(none)"
    else
        local shown = #empty
        if shown > 400 then shown = 400 end
        for i = 1, shown do sb[#sb + 1] = empty[i] end
        if #empty > 400 then sb[#sb + 1] = "..." end
    end
end

if mode == "write-tests" then
    local pending = A.capture({ "git", "status", "--porcelain" })
    local diff = A.capture({ "git", "diff", "HEAD", "--", "src/ru/BSL/OpenIntegrations" })
    sb[#sb + 1] = ""
    sb[#sb + 1] = "## Uncommitted changes"
    sb[#sb + 1] = A.limit(pending, 200)
    sb[#sb + 1] = "## Uncommitted public BSL diff"
    sb[#sb + 1] = A.limit(diff, 800)
end

if mode == "explain-build" then
    local log = A.read(A.out .. "/build-log.txt")
    sb[#sb + 1] = ""
    sb[#sb + 1] = "BigFloppa result: " .. A.env("DOWNSTREAM_RESULT")
    sb[#sb + 1] = "BigFloppa url: " .. A.env("DOWNSTREAM_URL")
    sb[#sb + 1] = "## Build log"
    sb[#sb + 1] = A.limit(log or "log unavailable", 800)
end

if mode == "judge-tests" then
    local summary = A.read(A.out .. "/tests-summary.md")
    sb[#sb + 1] = ""
    sb[#sb + 1] = "## Test results"
    sb[#sb + 1] = A.limit(summary or "summary unavailable", 800)
end

A.write(A.out .. "/task.md", table.concat(sb, "\n") .. "\n")
print("Wrote task.md for " .. mode)
os.exit(0)
