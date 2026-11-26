local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local O = dofile(dir .. "/../../ci/lib/os.lua")

local root = O.repo()

local function git(args)
    local cmd = { "git", "-C", root }
    for i = 1, #args do cmd[#cmd + 1] = args[i] end
    local code = O.run(cmd)
    if code ~= 0 then return code end
    return 0
end

local function sync(ref)
    if O.windows then
        return O.exec("call " .. O.quote(root .. "/src/addins/sync-addins.bat") .. " " .. ref)
    end
    return O.exec("sh " .. O.quote(root .. "/src/addins/sync-addins.sh") .. " " .. O.quote(ref))
end

local ref = arg[1]
if not ref or ref == "" then ref = O.env("ADDINS_BRANCH") end
if ref == "" then ref = "addins" end
local low = ref:lower()
if low == "addins" then
    ref = "addins"
elseif not low:match("^addins%-alpaca%-%d+$") then
    io.stderr:write("Invalid add-ins branch: " .. ref .. "\n")
    os.exit(1)
else
    ref = low
end

local head, headCode = O.capture({ "git", "-C", root, "rev-parse", "--abbrev-ref", "HEAD" })
if headCode ~= 0 then os.exit(headCode) end
head = O.trim(head)
if head:lower() == ref:lower() then
    io.stderr:write("Checkout a work branch first.\n")
    os.exit(1)
end

local zips = O.listfiles(root .. "/src/ru/OInt/addins", false)
local found = false
for _, name in ipairs(zips) do
    if name:lower():match("%.zip$") then found = true break end
end
if not found then
    io.stderr:write("No zip files in src/ru/OInt/addins\n")
    os.exit(1)
end

local function fail()
    O.run({ "git", "-C", root, "checkout", "-f", head })
    O.run({ "git", "-C", root, "branch", "-D", "addins-publish-tmp" })
    sync(ref)
    os.exit(1)
end

O.run({ "git", "-C", root, "branch", "-D", "addins-publish-tmp" })
if git({ "checkout", "--orphan", "addins-publish-tmp" }) ~= 0 then fail() end
if git({ "reset" }) ~= 0 then fail() end
local function git_add(pathspec)
    local line
    if O.windows then
        line = "cd /d " .. O.quote(root) .. " & git add -f " .. pathspec
    else
        line = "cd " .. O.quote(root) .. " && git add -f " .. pathspec
    end
    if O.exec(line) ~= 0 then fail() end
end

git_add("src/ru/OInt/addins/*.zip")
git_add("src/en/OInt/addins/*.zip")

for _, lang in ipairs({ "ru", "en" }) do
    local base = root .. "/src/" .. lang .. "/BSL/OpenIntegrations/src/CommonTemplates"
    for _, name in ipairs(O.listdirs(base)) do
        local file = "src/" .. lang .. "/BSL/OpenIntegrations/src/CommonTemplates/" .. name .. "/Template.addin"
        if O.isfile(root .. "/" .. file) then
            if git({ "add", "-f", "--", file }) ~= 0 then fail() end
        end
    end
end

if git({ "commit", "-m", "addins: publish" }) ~= 0 then fail() end
if git({ "push", "--force", "origin", "HEAD:refs/heads/" .. ref }) ~= 0 then fail() end
if git({ "checkout", "-f", head }) ~= 0 then fail() end
O.run({ "git", "-C", root, "branch", "-D", "addins-publish-tmp" })
if sync(ref) ~= 0 then os.exit(1) end
print("Published to origin/" .. ref .. ".")
os.exit(0)
