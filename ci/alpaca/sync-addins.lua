local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local function git_text(args)
    local text, code = A.capture(args)
    if code ~= 0 then os.exit(code) end
    return A.trim(text)
end

local root = git_text({ "git", "rev-parse", "--show-toplevel" })

local function git_at(args)
    local cmd = { "git", "-C", root }
    for i = 1, #args do cmd[#cmd + 1] = args[i] end
    return A.run(cmd)
end

local function git(args)
    local code = git_at(args)
    if code ~= 0 then os.exit(code) end
end

local ref = arg[1]
if not ref or ref == "" then ref = A.env("ADDINS_BRANCH") end
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

local head = git_text({ "git", "-C", root, "rev-parse", "--abbrev-ref", "HEAD" })
if A.ieq(head, ref) then
    print("Already on " .. ref .. ".")
    os.exit(0)
end

if git_at({ "fetch", "origin", ref, "--depth=1" }) ~= 0 then
    if ref == "addins" then os.exit(1) end
    print(ref .. " is not on origin yet. Syncing addins.")
    ref = "addins"
    git({ "fetch", "origin", "addins", "--depth=1" })
end

git({
    "restore", "--source=origin/" .. ref, "--worktree", "--",
    "src/ru/OInt/addins/", "src/en/OInt/addins/",
})

local listed, listCode = A.capture({
    "git", "-C", root, "ls-tree", "-r", "--name-only", "origin/" .. ref, "--",
    "src/ru/BSL/OpenIntegrations/src/CommonTemplates",
    "src/en/BSL/OpenIntegrations/src/CommonTemplates",
})
if listCode ~= 0 then os.exit(listCode) end
for _, file in ipairs(A.lines(listed)) do
    if file ~= "" then
        git({ "restore", "--source=origin/" .. ref, "--worktree", "--", file })
    end
end

print("Add-ins synced from origin/" .. ref .. ".")
os.exit(0)
