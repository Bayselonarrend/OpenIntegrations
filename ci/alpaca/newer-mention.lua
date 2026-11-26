local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")
local T = dofile(A.lib .. "/targets.lua")(A)

local began = A.read(A.out .. "/began.txt")
if not began then A.die("began.txt is missing") end
began = A.timekey(began)

local prText = A.trim(A.read(A.out .. "/pr.txt") or "")
local pr = prText:match("^%d+$") and tonumber(prText) or 0
for _, stamp in ipairs(T.stamps(tonumber(A.issue()), pr)) do
    if stamp.kind ~= "start"
        and A.timekey(stamp.at) > began
        and A.mentions_agent(stamp.body) then
        print("newer mention from " .. tostring(stamp.login))
        os.exit(0)
    end
end
os.exit(2)
