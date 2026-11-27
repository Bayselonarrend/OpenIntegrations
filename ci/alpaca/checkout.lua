local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local branch = A.env("ALPACA_BRANCH")
local number = branch:match("^alpaca/(%d+)$")
if not number then A.die("Bad ALPACA_BRANCH: " .. branch) end
local addinsBranch = "addins-alpaca-" .. number

local function git(args)
    local code = A.run(args)
    if code ~= 0 then os.exit(code) end
end

git({ "git", "fetch", "origin", "main" })
local remote, remoteCode = A.capture({ "git", "ls-remote", "--heads", "origin", branch })
if remoteCode ~= 0 then os.exit(remoteCode) end
if A.trim(remote) ~= "" then
    git({ "git", "fetch", "origin", branch })
    git({ "git", "checkout", "-f", "-B", branch, "origin/" .. branch })
else
    git({ "git", "checkout", "-f", "-B", branch, "origin/main" })
end
git({ "git", "clean", "-fd", "-e", "ci/alpaca/out" })

-- Pipeline scripts stay on main. The issue branch keeps the copy from the day it was cut.
-- feelings.txt stays with the issue branch and is committed with it.
git({ "git", "checkout", "origin/main", "--", "ci/alpaca" })
git({ "git", "reset", "-q", "HEAD", "--", "ci/alpaca" })
local listed, listCode = A.capture({ "git", "ls-files", "--", "ci/alpaca" })
if listCode ~= 0 then os.exit(listCode) end
for _, file in ipairs(A.lines(listed)) do
    if file ~= "" then
        if A.is_feelings(file) then
            git({ "git", "update-index", "--no-skip-worktree", "--", file })
            git({ "git", "checkout", "HEAD", "--", file })
        else
            git({ "git", "update-index", "--skip-worktree", "--", file })
        end
    end
end

local tooling = {
    "src/addins/sync-addins.bat",
    "src/addins/sync-addins.sh",
    "src/addins/publish-addins.lua",
}
git({ "git", "checkout", "origin/main", "--", tooling[1], tooling[2], tooling[3] })
git({ "git", "reset", "-q", "HEAD", "--", tooling[1], tooling[2], tooling[3] })
for _, file in ipairs(tooling) do
    git({ "git", "update-index", "--skip-worktree", "--", file })
end

A.rmtree(A.out)
A.mkdirs(A.out)
local code = A.run({ "lua", "ci/alpaca/sync-addins.lua", addinsBranch })
if code ~= 0 then os.exit(code) end
print("Checked out " .. branch)
os.exit(0)
