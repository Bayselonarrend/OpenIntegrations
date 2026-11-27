local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local countText, countCode = A.capture({ "git", "rev-list", "--count", "origin/main..HEAD" })
if countCode ~= 0 then os.exit(countCode) end
local ahead = tonumber(A.trim(countText)) or 0
if ahead == 0 then A.die("Branch is not ahead of main") end

local text, code = A.capture({
    "git", "diff", "--name-only", "origin/main", "HEAD", "--", "src/addins",
})
if code ~= 0 then os.exit(code) end

local seen = {}
local names = {}
for _, row in ipairs(A.lines(text)) do
    local name = row:gsub("\\", "/"):match("^src/addins/([^/]+)/")
    if name and name ~= "commons" and not seen[name] then
        if A.isfile("src/addins/" .. name .. "/release.bat") then
            seen[name] = true
            names[#names + 1] = name
        end
    end
end
table.sort(names)
if #names == 0 then
    print("No add-in release to rebuild")
    os.exit(0)
end
if not A.windows then A.die("Add-in release.bat runs on Windows") end

for _, name in ipairs(names) do
    print("Rebuilding " .. name)
    local built = A.exec("pushd " .. A.quote("src\\addins\\" .. name) .. " && call release.bat")
    if built ~= 0 then os.exit(built) end
end
print("Rebuilt " .. table.concat(names, ", "))
os.exit(0)
