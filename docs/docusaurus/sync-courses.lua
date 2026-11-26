local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local O = dofile(dir .. "/../../ci/lib/os.lua")

local primary = O.abspath(dir .. "/../../../OpenIntegrations-Courses")
local fallback = O.abspath(dir .. "/../../OpenIntegrations-Courses")
local source = O.isdir(primary) and primary or fallback
if not O.isdir(source) then
    io.stderr:write("[ERROR] Source repo not found.\n")
    io.stderr:write("Tried:\n")
    io.stderr:write("  " .. primary .. "\n")
    io.stderr:write("  " .. fallback .. "\n")
    io.stderr:write("Clone OpenIntegrations-Courses into repository root and retry.\n")
    os.exit(1)
end

print("Syncing course content from " .. source)

local function optional(rel)
    local from = source .. "/" .. rel
    if O.isfile(from) then O.copy(from, O.abspath(dir .. "/" .. rel)) end
end

O.mirror(source .. "/courses", O.abspath(dir .. "/courses"))
optional("data/courses.json")
optional("src/pages/courses.js")
optional("src/pages/courses.module.css")
O.mirror(source .. "/static/img/Courses", O.abspath(dir .. "/static/img/Courses"))

print("Courses sync completed.")
os.exit(0)
