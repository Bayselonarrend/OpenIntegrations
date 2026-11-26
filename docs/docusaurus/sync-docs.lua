local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local O = dofile(dir .. "/../../ci/lib/os.lua")

local source = O.abspath(dir .. "/../ru/md")
local target = O.abspath(dir .. "/docs")
local root = O.abspath(dir .. "/../..")

if not O.isdir(source) then
    io.stderr:write("[ERROR] Source not found: " .. source .. "\n")
    os.exit(1)
end

print("Syncing docs from " .. source .. " to " .. target)
O.mirror(source, target)
print("Docs sync completed.")

print("Generating releases archive...")
local generator = root .. "/ci/os/internal/Classes/ReleasesArchiveGenerator.os"
local code
if O.windows then
    code = O.exec("cd /d " .. O.quote(root) .. " & oscript " .. O.quote(generator))
else
    code = O.exec("cd " .. O.quote(root) .. " && oscript " .. O.quote(generator))
end
if code ~= 0 then
    io.stderr:write("[ERROR] Failed to generate releases archive.\n")
    os.exit(code)
end
os.exit(0)
