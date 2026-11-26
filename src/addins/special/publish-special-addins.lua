local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local O = dofile(dir .. "/../../../ci/lib/os.lua")

local root = O.repo()
local branch = "addins-special"
local output = "src/addins/special/output"

local function git(args)
    local cmd = { "git", "-C", root }
    for i = 1, #args do cmd[#cmd + 1] = args[i] end
    return O.run(cmd)
end

local function sync()
    if O.windows then
        return O.exec("call " .. O.quote(root .. "/src/addins/special/sync-special-addins.bat"))
    end
    return O.exec("sh " .. O.quote(root .. "/src/addins/special/sync-special-addins.sh"))
end

local head, headCode = O.capture({ "git", "-C", root, "rev-parse", "--abbrev-ref", "HEAD" })
if headCode ~= 0 then os.exit(headCode) end
head = O.trim(head)
if head:lower() == branch then
    io.stderr:write("Checkout main first.\n")
    os.exit(1)
end

local found = false
for _, name in ipairs(O.listfiles(root .. "/" .. output, false)) do
    if name:lower():match("%.zip$") then found = true break end
end
if not found then
    io.stderr:write("No zip files in " .. output .. "\n")
    os.exit(1)
end

local function fail()
    O.run({ "git", "-C", root, "checkout", "-f", head })
    O.run({ "git", "-C", root, "branch", "-D", branch })
    sync()
    os.exit(1)
end

O.run({ "git", "-C", root, "branch", "-D", branch })
if git({ "checkout", "--orphan", branch }) ~= 0 then fail() end
if git({ "reset" }) ~= 0 then fail() end
local addLine
if O.windows then
    addLine = "cd /d " .. O.quote(root) .. " & git add -f " .. output .. "/*.zip"
else
    addLine = "cd " .. O.quote(root) .. " && git add -f " .. output .. "/*.zip"
end
if O.exec(addLine) ~= 0 then fail() end
if git({ "commit", "-m", "addins-special: publish" }) ~= 0 then fail() end
if git({ "push", "--force", "origin", branch }) ~= 0 then fail() end
if git({ "checkout", "-f", head }) ~= 0 then fail() end
O.run({ "git", "-C", root, "branch", "-D", branch })
if sync() ~= 0 then os.exit(1) end
print("Published to origin/" .. branch .. ".")
os.exit(0)
