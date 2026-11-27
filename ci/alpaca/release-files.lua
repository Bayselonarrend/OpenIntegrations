local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local function allowed(path)
    path = tostring(path or ""):gsub("\\", "/")
    if path == "service/releases.json" then return true end
    if path == "service/dictionaries/en.json" then return true end
    if path == "service/dictionaries/knownWords.txt" then return true end
    if path == "media/catalogs/names.json" then return true end
    if path:match("^docs/ru/md/Start/") then return true end
    if path:match("^docs/en/md/Start/") then return true end
    if path:match("^docs/ru/md/Instructions/[^/]+%.md$") then return true end
    if path:match("^docs/en/md/Instructions/[^/]+%.md$") then return true end
    if path:match("^ci/alpaca/out/") then return true end
    if path:match("^ci/alpaca/agents/[^/]+/feelings%.txt$") then return true end
    return false
end

local text, code = A.capture({ "git", "status", "--porcelain" })
if code ~= 0 then os.exit(code) end
local bad = {}
for _, line in ipairs(A.lines(text)) do
    local path = line:match("^.. (.+)$")
    if path then
        local arrow = path:match(" %-> (.+)$")
        if arrow then path = arrow end
        path = path:gsub("^\"", ""):gsub("\"$", "")
        if not allowed(path) then bad[#bad + 1] = path end
    end
end
if #bad > 0 then
    A.die("Files outside the release set: " .. table.concat(bad, ", "))
end
os.exit(0)
