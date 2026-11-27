local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local path = "src/ru/BSL/Tests"
if not A.isdir(path) then
    print("No test tree")
    os.exit(0)
end

local function git(args)
    local code = A.run(args)
    if code ~= 0 then os.exit(code) end
end

git({ "git", "checkout", "--", path })
git({ "git", "clean", "-fd", "--", path })
print("Author test edits dropped")
os.exit(0)
