local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local text = A.capture({ "git", "status", "--porcelain" })
for _, line in ipairs(A.lines(text)) do
    local path = line:match("^.. (.+)$")
    if path then
        local arrow = path:match(" %-> (.+)$")
        if arrow then path = arrow end
        path = path:gsub("^\"", ""):gsub("\"$", "")
        if not A.is_feelings(path) then os.exit(0) end
    end
end
os.exit(2)
