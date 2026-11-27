local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local issue = A.env("ALPACA_ISSUE")
local branch = A.env("ALPACA_BRANCH")
if not issue:match("^%d+$") or branch ~= "alpaca/" .. issue then
    print("SKIP")
    os.exit(2)
end

local head, headCode = A.capture({ "git", "rev-parse", "--abbrev-ref", "HEAD" })
if headCode ~= 0 or A.trim(head) ~= branch then
    print("SKIP")
    os.exit(2)
end

local root = "ci/alpaca/agents"
if not A.isdir(root) then
    print("NO_CHANGES")
    os.exit(2)
end

for _, name in ipairs(A.listdirs(root)) do
    local path = root .. "/" .. name .. "/feelings.txt"
    if A.isfile(path) then
        local listed = A.capture({ "git", "ls-files", "--", path })
        if A.trim(listed) ~= "" then
            local code = A.run({ "git", "update-index", "--no-skip-worktree", "--", path })
            if code ~= 0 then os.exit(code) end
        end
        local code = A.run({ "git", "add", "--", path })
        if code ~= 0 then os.exit(code) end
    end
end

local staged, stagedCode = A.capture({ "git", "diff", "--cached", "--name-only" })
if stagedCode ~= 0 then os.exit(stagedCode) end
local keep = false
for _, path in ipairs(A.lines(staged)) do
    local norm = A.trim(path):gsub("\\", "/")
    if norm ~= "" then
        if A.is_feelings(norm) then
            keep = true
        else
            local code = A.run({ "git", "reset", "-q", "--", path })
            if code ~= 0 then os.exit(code) end
        end
    end
end
if not keep then
    print("NO_CHANGES")
    os.exit(2)
end

A.mkdirs(A.out)
local msgFile = A.out .. "/feelings-msg.txt"
A.write(msgFile, "Повтор, который можно отдать в MCP\n")

local agent = A.agent(A.env("ALPACA_AGENT"))
local code = A.with_identity(agent, function()
    return A.run({ "git", "commit", "-F", msgFile })
end)
if code ~= 0 then os.exit(code) end
local pushed = A.run({ "git", "push", "origin", "HEAD:" .. branch })
if pushed ~= 0 then os.exit(pushed) end
print("PUSHED")
os.exit(0)
