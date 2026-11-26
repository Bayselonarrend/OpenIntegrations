local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local heads, code = A.capture({ "git", "ls-remote", "--heads", "origin", "refs/heads/addins-alpaca-*" })
if code ~= 0 then os.exit(code) end

local removed = 0
for _, line in ipairs(A.lines(heads)) do
    if line ~= "" then
        local ref = A.trim(line:match("\t(.*)$") or line)
        local number = ref:match("^refs/heads/addins%-alpaca%-(%d+)$")
        if number then
            local parent, parentCode = A.capture({
                "git", "ls-remote", "--heads", "origin", "refs/heads/alpaca/" .. number,
            })
            if parentCode ~= 0 then os.exit(parentCode) end
            if A.trim(parent) == "" then
                local deleted = A.run({ "git", "push", "origin", "--delete", "addins-alpaca-" .. number })
                if deleted ~= 0 then os.exit(deleted) end
                print("Deleted addins-alpaca-" .. number)
                removed = removed + 1
            end
        end
    end
end
if removed == 0 then print("No stale add-in branches") end
os.exit(0)
