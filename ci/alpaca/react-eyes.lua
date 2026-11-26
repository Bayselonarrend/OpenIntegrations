local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")
local T = dofile(A.lib .. "/targets.lua")(A)

local agent = A.agent(A.env("ALPACA_AGENT"))
local issue = A.issue()
local pr = 0
local prText = A.trim(A.read(A.out .. "/pr.txt") or "")
if prText:match("^%d+$") then pr = tonumber(prText) end

local stamps = T.stamps(tonumber(issue), pr)
local latest = A.latest_start(agent, stamps)
local directive = A.latest_directive(stamps)
local seen = {}
local count = 0
for _, stamp in ipairs(stamps) do
    if A.wakes(agent, stamp, latest, directive) and stamp.id ~= "" and not seen[stamp.id] then
        seen[stamp.id] = true
        T.eyes(stamp.id)
        print("eyes " .. stamp.id)
        count = count + 1
    end
end
if count == 0 then os.exit(2) end
os.exit(0)
