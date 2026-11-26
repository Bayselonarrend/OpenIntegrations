local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local text = A.capture({ "git", "status", "--porcelain" })
if A.trim(text) == "" then os.exit(2) end
os.exit(0)
