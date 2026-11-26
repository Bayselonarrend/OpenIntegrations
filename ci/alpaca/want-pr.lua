local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local text = A.read(A.out .. "/open-pr.txt")
if not text then os.exit(2) end
local line = nil
for _, row in ipairs(A.lines(text)) do
    if A.trim(row) ~= "" then
        line = A.trim(row)
        break
    end
end
if not line or line:lower() ~= "yes" then os.exit(2) end
os.exit(0)
