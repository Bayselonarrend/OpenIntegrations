local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")
local T = dofile(A.lib .. "/targets.lua")(A)

local prText = A.trim(A.read(A.out .. "/pr.txt") or "")
local pr = prText:match("^%d+$") and tonumber(prText) or 0
local best = ""
for _, stamp in ipairs(T.stamps(tonumber(A.issue()), pr)) do
    local key = A.timekey(stamp.at)
    if key > best then best = key end
end
A.write(A.out .. "/began.txt", best)
os.exit(0)
