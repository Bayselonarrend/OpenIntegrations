local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local issue = A.issue()
local branch = A.branch()
A.mkdirs(A.out)

local function git_exit(args)
    local code = A.run(args)
    if code ~= 0 then os.exit(code) end
end

local tracked = A.capture({ "git", "ls-files", "*dependencies.log" })
for _, log in ipairs(A.lines(tracked)) do
    if log ~= "" then A.run({ "git", "checkout", "-q", "--", log }) end
end

git_exit({ "git", "add", "-A" })
if A.isdir("ci/alpaca/out") then A.run({ "git", "reset", "-q", "--", "ci/alpaca/out" }) end

local indexed = A.capture({ "git", "ls-files", "--", "src/addins" })
for _, path in ipairs(A.lines(indexed)) do
    local norm = path:gsub("\\", "/")
    if norm:match("^src/addins/.+/artifacts/.+") then
        git_exit({ "git", "rm", "-q", "--cached", "--", path })
    end
end

local staged = A.capture({ "git", "diff", "--cached", "--name-only" })
for _, path in ipairs(A.lines(staged)) do
    if path ~= "" and path:find("dependencies.log", 1, true) then
        A.run({ "git", "reset", "-q", "--", path })
        A.run({ "git", "checkout", "-q", "--", path })
    end
end

local quiet = A.run({ "git", "diff", "--cached", "--quiet" })
if quiet == 0 then
    print("NO_CHANGES")
    os.exit(2)
end
if quiet > 1 then os.exit(quiet) end

local msgFile = A.out .. "/commit-msg.txt"
local msg = A.trim(A.read(msgFile) or "")
if #msg > 4000 then msg = A.trim(A.clip(msg, 4000)) end
if msg == "" then
    local title, code = A.capture({
        "gh", "issue", "view", issue, "--repo", A.repo, "--json", "title", "--jq", ".title",
    })
    if code == 0 then title = A.trim(title:gsub("[\r\n]+", " ")) else title = "" end
    if title == "" then title = "Issue " .. issue end
    msg = title
end
A.write(msgFile, A.trim(msg) .. "\n")

local agent = A.agent(A.env("ALPACA_AGENT"))
local code = A.with_identity(agent, function()
    return A.run({ "git", "commit", "-F", msgFile })
end)
if code ~= 0 then os.exit(code) end
git_exit({ "git", "push", "origin", "HEAD:" .. branch })
print("PUSHED")
os.exit(0)
