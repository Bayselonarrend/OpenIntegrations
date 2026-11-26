local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

if not A.isdir(".git") and not A.isfile(".git") then os.exit(0) end
local listed = A.capture({ "git", "ls-files", "-v" })
for _, line in ipairs(A.lines(listed)) do
    if line:sub(1, 2) == "S " then
        A.run({ "git", "update-index", "--no-skip-worktree", "--", line:sub(3) })
    end
end
os.exit(0)
