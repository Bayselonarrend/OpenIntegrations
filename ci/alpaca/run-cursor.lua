local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local taskFile = arg[1]
if not taskFile or not A.isfile(taskFile) then A.die("Task file not found: " .. tostring(taskFile)) end

local configDir = A.abspath(A.out .. "/cursor-config")
A.mkdirs(A.out .. "/cursor-config")
A.write(A.out .. "/cursor-config/cli-config.json", [[
{
  "version": 1,
  "editor": { "vimMode": false },
  "permissions": {
    "allow": [],
    "deny": [
      "Shell(git)",
      "Shell(git.exe)",
      "Shell(gh)",
      "Shell(gh.exe)",
      "Shell(publish-addins.bat)",
      "Shell(publish-addins)",
      "Shell(publish-addins.lua)"
    ]
  }
}
]])

local function first_file(paths)
    for _, path in ipairs(paths) do
        if path and path ~= "" and A.isfile(path) then return path end
    end
end

local home = A.windows and A.env("USERPROFILE") or A.env("HOME")
local localapp = A.env("LOCALAPPDATA")
local candidates = {
    home .. "/.local/bin/agent",
    home .. "/.local/bin/cursor-agent",
    home .. "/.cursor/bin/agent",
}
if A.windows then
    candidates = {
        localapp .. "/cursor-agent/agent.cmd",
        localapp .. "/cursor-agent/cursor-agent.cmd",
        localapp .. "/cursor-agent/agent.exe",
        home .. "/.local/bin/agent.exe",
        home .. "/.cursor/bin/agent.exe",
    }
end
local exe = first_file(candidates)
if not exe then
    local names = { "agent", "cursor-agent" }
    if A.windows then names = { "agent.cmd", "cursor-agent.cmd", "agent.exe" } end
    for _, name in ipairs(names) do
        exe = A.which(name)
        if exe then break end
    end
end
if not exe then A.die("Cursor CLI not found. Install the agent command and put it on PATH.") end

local model = ""
if A.env("ALPACA_AGENT") ~= "" then
    model = tostring(A.agent(A.env("ALPACA_AGENT")).model or "")
end
local workspace = A.cwd()
local fullTask = A.abspath(taskFile)
local prompt = "Read and follow " .. fullTask .. ". git, gh and publish-addins are forbidden, including by full path. Jenkins runs them."
local log = A.abspath(A.out .. "/cursor-cli.log")
local exitfile = A.abspath(A.out .. "/cursor-exit.txt")
local deny = A.abspath(A.root .. "/deny")

local argv = { exe }
if model ~= "" then
    argv[#argv + 1] = "--model"
    argv[#argv + 1] = model
end
argv[#argv + 1] = "--print"
argv[#argv + 1] = "--force"
argv[#argv + 1] = "--trust"
argv[#argv + 1] = "--approve-mcps"
argv[#argv + 1] = "--output-format"
argv[#argv + 1] = "stream-json"
argv[#argv + 1] = "--workspace"
argv[#argv + 1] = workspace
argv[#argv + 1] = prompt

print("Cursor CLI: " .. exe)
local proc = A.spawn({
    argv = argv,
    log = log,
    exitfile = exitfile,
    path_prefix = deny,
    env = {
        { "NODE_USE_SYSTEM_CA", "1" },
        { "CURSOR_CONFIG_DIR", configDir },
        { "CI", "1" },
        { "GH_PROMPT_DISABLED", "1" },
        { "GH_PAGER", "" },
        { "GIT_TERMINAL_PROMPT", "0" },
    },
})
if not proc then A.die("Cursor CLI did not start") end

local offset, carry = 0, ""
local saw, resultError, resultAt = false, false, nil

local function note(line)
    if line:find('"type"%s*:%s*"result"') then
        saw = true
        if not resultAt then resultAt = os.time() end
        if line:find('"is_error"%s*:%s*true') then resultError = true end
    end
end

local function read_log()
    local f = io.open(log, "rb")
    if not f then return end
    f:seek("set", offset)
    local chunk = f:read("*a")
    f:close()
    if not chunk or chunk == "" then return end
    offset = offset + #chunk
    carry = carry .. chunk
    while true do
        local nl = carry:find("\n", 1, true)
        if not nl then break end
        local line = carry:sub(1, nl - 1):gsub("\r$", "")
        carry = carry:sub(nl + 1)
        if line ~= "" then print(line) end
        note(line)
    end
    note(carry)
end

while true do
    read_log()
    if not A.alive(proc) then break end
    if saw and resultAt and (os.time() - resultAt) >= 20 then
        print("Cursor CLI finished the turn and did not exit. Stopping it.")
        A.kill(proc)
        break
    end
    A.sleep(1)
end
local waited = 0
while A.alive(proc) and waited < 15 do
    A.sleep(1)
    waited = waited + 1
end
A.sleep(1)
read_log()
local code = A.finish(proc)
if A.trim(carry) ~= "" then print((carry:gsub("\r$", ""))) end

if saw then
    if resultError then os.exit(1) end
    os.exit(0)
end
print("Cursor CLI exit: " .. tostring(code or 1))
os.exit(code or 1)
