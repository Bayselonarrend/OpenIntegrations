local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local issue = A.issue()
local state, code = A.capture({
    "gh", "issue", "view", issue, "--repo", A.repo, "--json", "state", "--jq", ".state",
})
if code ~= 0 then os.exit(code) end
state = A.trim(state)
if not A.ieq(state, "OPEN") then
    print("issue " .. issue .. " is " .. state)
    os.exit(3)
end
print("issue " .. issue .. " is open")
os.exit(0)
