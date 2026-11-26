-- Shared helpers for the Alpaca Lua 5.1 scripts.
local function source_dir()
    local src = debug.getinfo(1, "S").source
    if src:sub(1, 1) == "@" then src = src:sub(2) end
    src = src:gsub("\\", "/")
    return src:match("^(.*)/[^/]+$") or "."
end

local libdir = source_dir()
local json = dofile(libdir .. "/json.lua")
local root = libdir:match("^(.*)/[^/]+$") or libdir

local A = {
    json = json,
    lib = libdir,
    root = root,
    out = root .. "/out",
    repo = "Bayselonarrend/OpenIntegrations",
    windows = package.config:sub(1, 1) == "\\",
}

local seq = 0

function A.code(status)
    if status == true or status == 0 then return 0 end
    if status == false or status == nil then return 1 end
    if type(status) == "number" then
        if status < 0 then return 1 end
        if status > 255 then return math.floor(status / 256) % 256 end
        return status
    end
    return 1
end

function A.die(msg)
    io.stderr:write(tostring(msg) .. "\n")
    os.exit(1)
end

function A.quote(s)
    s = tostring(s)
    if A.windows then
        return '"' .. s:gsub('"', '""') .. '"'
    end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end

function A.argv(args)
    local parts = {}
    for i = 1, #args do parts[i] = A.quote(args[i]) end
    return table.concat(parts, " ")
end

function A.exec(line)
    if A.windows then
        return A.code(os.execute("set GH_PROMPT_DISABLED=1& set GH_PAGER=& set GIT_TERMINAL_PROMPT=0& " .. line))
    end
    return A.code(os.execute("GH_PROMPT_DISABLED=1 GH_PAGER= GIT_TERMINAL_PROMPT=0 " .. line))
end

function A.run(args)
    return A.exec(A.argv(args))
end

function A.trim(s)
    return (tostring(s or ""):gsub("^%s+", ""):gsub("%s+$", ""))
end

function A.ieq(a, b)
    return tostring(a or ""):lower() == tostring(b or ""):lower()
end

function A.env(name)
    return os.getenv(name) or ""
end

function A.lines(text)
    local rows = {}
    text = tostring(text or ""):gsub("\r\n", "\n"):gsub("\r", "\n")
    local i = 1
    while i <= #text do
        local j = text:find("\n", i, true)
        if not j then
            rows[#rows + 1] = text:sub(i)
            break
        end
        rows[#rows + 1] = text:sub(i, j - 1)
        i = j + 1
    end
    return rows
end

function A.limit(text, maxLines)
    text = text or ""
    local rows = A.lines(text)
    if #rows <= maxLines then return text end
    local cut = {}
    for i = 1, maxLines do cut[i] = rows[i] end
    return table.concat(cut, "\n") .. "\n..."
end

function A.clip(s, maxBytes)
    if #s <= maxBytes then return s end
    local i = maxBytes
    while i > 0 do
        local b = s:byte(i)
        if b < 128 or b >= 192 then break end
        i = i - 1
    end
    if i > 0 and s:byte(i) >= 192 then i = i - 1 end
    if i < 1 then i = maxBytes end
    return s:sub(1, i)
end

function A.timekey(s)
    return (tostring(s or ""):gsub("(%d%d:%d%d:%d%d)%.%d+", "%1"))
end

function A.isfile(path)
    local f = io.open(path, "rb")
    if f then f:close() return true end
    return false
end

function A.isdir(path)
    path = tostring(path or ""):gsub("[/\\]+$", "")
    if path == "" then return false end
    local line
    if A.windows then
        line = "pushd " .. A.quote(path) .. " >nul 2>&1 && popd && echo DIR"
    else
        line = "test -d " .. A.quote(path) .. " && echo DIR"
    end
    local p = io.popen(line, "r")
    if not p then return false end
    local text = p:read("*a") or ""
    p:close()
    return text:find("DIR", 1, true) ~= nil
end

function A.mkdirs(path)
    if path == nil or path == "" or A.isdir(path) then return end
    if A.windows then
        A.exec("mkdir " .. A.quote(path))
    else
        A.exec("mkdir -p " .. A.quote(path))
    end
end

function A.rmtree(path)
    if A.isdir(path) then
        if A.windows then
            A.exec("rmdir /s /q " .. A.quote(path))
        else
            A.exec("rm -rf " .. A.quote(path))
        end
    elseif A.isfile(path) then
        os.remove(path)
    end
end

function A.read(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local text = f:read("*a") or ""
    f:close()
    if text:sub(1, 3) == "\239\187\191" then text = text:sub(4) end
    return text
end

function A.write(path, text)
    local dir = path:match("^(.*)[/\\][^/\\]+$")
    if dir then A.mkdirs(dir) end
    local f = assert(io.open(path, "wb"))
    f:write(text)
    f:close()
end

function A.filesize(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local n = f:seek("end")
    f:close()
    return n
end

function A.temp(tag)
    seq = seq + 1
    A.mkdirs(A.out)
    return A.out .. "/_tmp_" .. tag .. "_" .. seq .. ".txt"
end

function A.capture(args)
    local path = A.temp("cap")
    local code = A.exec(A.argv(args) .. " > " .. A.quote(path))
    local text = A.read(path) or ""
    os.remove(path)
    return text, code
end

function A.listdirs(path)
    if not A.isdir(path) then return {} end
    local line
    if A.windows then
        line = "cmd /d /c dir /b /ad " .. A.quote(path)
    else
        line = "find " .. A.quote(path) .. " -mindepth 1 -maxdepth 1 -type d"
    end
    local p = io.popen(line, "r")
    if not p then return {} end
    local text = p:read("*a") or ""
    p:close()
    local names = {}
    for _, row in ipairs(A.lines(text)) do
        local name = row:gsub("\\", "/"):match("([^/]+)$")
        if name and name ~= "" and name ~= "." and name ~= ".." then
            names[#names + 1] = name
        end
    end
    return names
end

function A.norm(path)
    path = tostring(path or ""):gsub("\\", "/")
    local drive = path:match("^(%a:)")
    local absolute = path:sub(1, 1) == "/"
    local parts, n = {}, 0
    for seg in path:gmatch("[^/]+") do
        if seg == ".." then
            if n > 0 and parts[n] ~= ".." and not parts[n]:match("^%a:$") then
                parts[n] = nil
                n = n - 1
            elseif not drive and not absolute then
                n = n + 1
                parts[n] = seg
            end
        elseif seg ~= "." then
            n = n + 1
            parts[n] = seg
        end
    end
    local out = table.concat(parts, "/", 1, n)
    if absolute then return "/" .. out end
    return out
end

function A.cwd()
    local path = A.temp("cwd")
    -- On Windows `cd` is a builtin of the cmd that runs the script.
    local code = A.exec((A.windows and "cd" or "pwd") .. " > " .. A.quote(path))
    if code ~= 0 then A.die("cwd failed with " .. tostring(code)) end
    local text = A.trim(A.read(path) or "")
    os.remove(path)
    return text
end

function A.abspath(path)
    path = tostring(path or ""):gsub("\\", "/")
    local rooted = path:match("^%a:/") or path:match("^/")
    if not rooted then
        local cwd = A.cwd():gsub("\\", "/")
        if cwd:sub(-1) ~= "/" then cwd = cwd .. "/" end
        path = cwd .. path
    end
    return A.norm(path)
end

function A.sleep(seconds)
    seconds = tonumber(seconds) or 1
    if seconds < 1 then seconds = 1 end
    if A.windows then
        os.execute("ping -n " .. math.floor(seconds + 1) .. " 127.0.0.1 > nul")
    else
        os.execute("sleep " .. math.floor(seconds))
    end
end

local function proc_pid(proc)
    if type(proc) == "table" then return proc.pid end
    return proc
end

function A.alive(proc)
    local pid = tostring(proc_pid(proc) or "")
    if pid == "" then return false end
    if A.windows then
        local text = A.capture({ "tasklist", "/FI", "PID eq " .. pid, "/NH" })
        return text:find("%f[%d]" .. pid .. "%f[%D]") ~= nil
    end
    return A.run({ "kill", "-0", pid }) == 0
end

local function unix_rows()
    local path = A.temp("ps")
    local code = A.exec("ps -A -o pid= -o ppid= > " .. A.quote(path))
    local text = A.read(path) or ""
    os.remove(path)
    if code ~= 0 then return {} end
    local rows = {}
    for _, line in ipairs(A.lines(text)) do
        local pid, ppid = line:match("^%s*(%d+)%s+(%d+)%s*$")
        if pid then rows[#rows + 1] = { pid = pid, ppid = ppid } end
    end
    return rows
end

local function unix_descendants(pid, rows, out)
    for _, row in ipairs(rows) do
        if row.ppid == tostring(pid) then
            unix_descendants(row.pid, rows, out)
            out[#out + 1] = row.pid
        end
    end
end

function A.kill(proc)
    local pid = tostring(proc_pid(proc) or "")
    if pid == "" then return end
    if A.windows then
        A.run({ "taskkill", "/F", "/T", "/PID", pid })
        return
    end
    local victims = {}
    unix_descendants(pid, unix_rows(), victims)
    victims[#victims + 1] = pid
    for _, item in ipairs(victims) do
        A.exec("kill -TERM " .. item .. " >/dev/null 2>&1")
    end
    for _, item in ipairs(victims) do
        A.exec("kill -KILL " .. item .. " >/dev/null 2>&1")
    end
end

function A.which(name)
    local text, code
    if A.windows then
        text, code = A.capture({ "where.exe", name })
    else
        local path = A.temp("which")
        code = A.exec("command -v " .. A.quote(name) .. " > " .. A.quote(path) .. " 2>/dev/null")
        text = A.read(path) or ""
        os.remove(path)
    end
    if code ~= 0 then return nil end
    for _, line in ipairs(A.lines(text)) do
        local found = A.trim(line)
        if found ~= "" and not found:lower():match("%.ps1$") and A.isfile(found) then
            return found
        end
    end
    return nil
end

function A.jenkins_home()
    local home = A.env("JENKINS_HOME")
    if home ~= "" and A.isdir(home) then return home end
    local ws = A.env("WORKSPACE")
    if ws ~= "" then
        local parent = ws:gsub("[/\\]+$", ""):gsub("[/\\][^/\\]+$", ""):gsub("[/\\][^/\\]+$", "")
        if parent ~= "" and A.isdir(parent .. "/jobs") then return parent end
    end
    if A.windows then
        local localapp = A.env("LOCALAPPDATA")
        if localapp ~= "" and A.isdir(localapp .. "/Jenkins/.jenkins") then
            return localapp .. "/Jenkins/.jenkins"
        end
    else
        local homeDir = A.env("HOME")
        if homeDir ~= "" and A.isdir(homeDir .. "/.jenkins") then
            return homeDir .. "/.jenkins"
        end
    end
    return nil
end

local function cmd_quote(s)
    return '"' .. tostring(s):gsub("%%", "%%%%"):gsub('"', '""') .. '"'
end

local function spawn_windows(opts)
    local runner = A.out .. "/run-agent.cmd"
    local bits = { "call" }
    for _, arg in ipairs(opts.argv) do bits[#bits + 1] = cmd_quote(arg) end
    local lines = { "@echo off" }
    if opts.path_prefix and opts.path_prefix ~= "" then
        lines[#lines + 1] = 'set "PATH=' .. opts.path_prefix .. ';%PATH%"'
    end
    for _, pair in ipairs(opts.env or {}) do
        lines[#lines + 1] = 'set "' .. pair[1] .. '=' .. pair[2] .. '"'
    end
    lines[#lines + 1] = table.concat(bits, " ") .. " < NUL > " .. cmd_quote(opts.log) .. " 2>&1"
    lines[#lines + 1] = "set ALPACA_CODE=%ERRORLEVEL%"
    lines[#lines + 1] = "> " .. cmd_quote(opts.exitfile) .. " echo %ALPACA_CODE%"
    lines[#lines + 1] = "exit /b %ALPACA_CODE%"
    A.write(runner, table.concat(lines, "\r\n") .. "\r\n")
    local vbs = A.out .. "/spawn.vbs"
    local pidfile = A.abspath(opts.exitfile) .. ".pid"
    os.remove(pidfile)
    A.write(vbs, table.concat({
        'Set sh = CreateObject("WScript.Shell")',
        'Set fso = CreateObject("Scripting.FileSystemObject")',
        'Set ex = sh.Exec("cmd.exe /d /c """ & WScript.Arguments(0) & """")',
        'Set pid = fso.CreateTextFile(WScript.Arguments(1), True)',
        "pid.WriteLine ex.ProcessID",
        "pid.Close",
        "Do While ex.Status = 0",
        "  WScript.Sleep 400",
        "Loop",
        "",
    }, "\r\n"))
    local pipe = io.popen(
        "cscript //nologo " .. A.quote(A.abspath(vbs)) .. " " .. A.quote(A.abspath(runner)) .. " " .. A.quote(pidfile),
        "r"
    )
    if not pipe then return nil end
    local pid = nil
    for _ = 1, 10 do
        pid = tonumber(A.trim(A.read(pidfile) or ""))
        if pid then break end
        A.sleep(1)
    end
    if not pid then
        pipe:close()
        return nil
    end
    return { pid = pid, pipe = pipe, exitfile = opts.exitfile }
end

local function spawn_unix(opts)
    local script = A.out .. "/run-agent.sh"
    local pidfile = opts.exitfile .. ".pid"
    os.remove(pidfile)
    local lines = { "#!/bin/sh", "printf '%s\\n' \"$$\" > " .. A.quote(pidfile) }
    if opts.path_prefix and opts.path_prefix ~= "" then
        local path = opts.path_prefix .. ":" .. A.env("PATH")
        lines[#lines + 1] = "export PATH=" .. A.quote(path)
    end
    for _, pair in ipairs(opts.env or {}) do
        lines[#lines + 1] = "export " .. pair[1] .. "=" .. A.quote(pair[2])
    end
    lines[#lines + 1] = A.argv(opts.argv) .. " < /dev/null > " .. A.quote(opts.log) .. " 2>&1"
    lines[#lines + 1] = "status=$?"
    lines[#lines + 1] = "printf '%s\\n' \"$status\" > " .. A.quote(opts.exitfile)
    lines[#lines + 1] = "exit \"$status\""
    A.write(script, table.concat(lines, "\n") .. "\n")
    local launch = "nohup sh " .. A.quote(script) .. " >/dev/null 2>&1 &"
    if A.exec("command -v setsid >/dev/null 2>&1") == 0 then
        launch = "setsid sh " .. A.quote(script) .. " >/dev/null 2>&1 &"
    end
    if A.exec(launch) ~= 0 then return nil end
    local pid = nil
    for _ = 1, 10 do
        pid = tonumber(A.trim(A.read(pidfile) or ""))
        if pid then break end
        A.sleep(1)
    end
    if not pid then return nil end
    return { pid = pid, exitfile = opts.exitfile }
end

function A.spawn(opts)
    A.mkdirs(A.out)
    os.remove(opts.log)
    os.remove(opts.exitfile)
    if A.windows then return spawn_windows(opts) end
    return spawn_unix(opts)
end

function A.finish(proc)
    if proc.pipe then
        proc.pipe:read("*a")
        proc.pipe:close()
        proc.pipe = nil
    end
    return tonumber(A.trim(A.read(proc.exitfile) or ""))
end

function A.decode(text, what)
    local ok, value = pcall(json.decode, text)
    if not ok then A.die((what or "command") .. " returned invalid JSON") end
    return value
end

function A.json_out(args, what)
    local text, code = A.capture(args)
    if code ~= 0 then A.die((what or "command") .. " failed with " .. tostring(code)) end
    text = A.trim(text)
    if text == "" then return nil end
    return A.decode(text, what)
end

function A.issue()
    local issue = A.env("ALPACA_ISSUE")
    if not issue:match("^%d+$") then A.die("Bad ALPACA_ISSUE: " .. issue) end
    return issue
end

function A.branch()
    local issue = A.issue()
    local branch = A.env("ALPACA_BRANCH")
    if branch ~= "alpaca/" .. issue then A.die("Branch does not match issue: " .. branch) end
    return branch
end

function A.agents()
    local list = {}
    for _, name in ipairs(A.listdirs(A.root .. "/agents")) do
        local path = A.root .. "/agents/" .. name .. "/agent.json"
        if A.isfile(path) then
            local agent = A.decode(A.read(path), path)
            agent.id = agent.id or name
            list[#list + 1] = agent
        end
    end
    table.sort(list, function(a, b)
        local ra = A.ieq(a.role, "author") and 0 or 1
        local rb = A.ieq(b.role, "author") and 0 or 1
        if ra ~= rb then return ra < rb end
        return tostring(a.id) < tostring(b.id)
    end)
    return list
end

function A.agent(id)
    if not id or id == "" then A.die("ALPACA_AGENT is empty") end
    for _, agent in ipairs(A.agents()) do
        if A.ieq(agent.id, id) then return agent end
    end
    A.die("Unknown agent: " .. id)
end

function A.reacts(agent, login)
    if type(agent.reactTo) ~= "table" then return false end
    for _, who in ipairs(agent.reactTo) do
        if A.ieq(who, login) then return true end
    end
    return false
end

function A.mentioned(agent, body)
    if type(body) ~= "string" or body == "" then return false end
    return body:lower():find("@" .. tostring(agent.login):lower(), 1, true) ~= nil
end

function A.eyes(stamp, login)
    for _, who in ipairs(stamp.eyes or {}) do
        if A.ieq(who, login) then return true end
    end
    return false
end

function A.latest_start(agent, stamps)
    local best = nil
    for _, stamp in ipairs(stamps) do
        if stamp.kind == "start" and A.ieq(stamp.login, agent.login) then
            if not best or A.timekey(stamp.at) > A.timekey(best) then best = stamp.at end
        end
    end
    return best
end

function A.mentions_agent(body)
    if type(body) ~= "string" or body == "" then return false end
    local low = body:lower()
    for _, agent in ipairs(A.agents()) do
        if low:find("@" .. tostring(agent.login):lower(), 1, true) then return true end
    end
    return false
end

function A.latest_directive(stamps)
    local best = nil
    for _, stamp in ipairs(stamps) do
        if stamp.kind ~= "start" and A.mentions_agent(stamp.body) then
            if not best or A.timekey(stamp.at) > A.timekey(best.at) then best = stamp end
        end
    end
    return best
end

function A.wakes(agent, stamp, latest, directive)
    if stamp.kind == "start" then return false end
    if A.ieq(stamp.login, agent.login) then return false end
    if not A.reacts(agent, stamp.login) then return false end
    if A.eyes(stamp, agent.login) then return false end
    if latest and A.timekey(stamp.at) <= A.timekey(latest) then return false end
    if not directive then return false end
    if directive.id ~= "" then
        if stamp.id ~= directive.id then return false end
    elseif A.timekey(stamp.at) ~= A.timekey(directive.at) or not A.ieq(stamp.login, directive.login) then
        return false
    end
    return A.mentioned(agent, stamp.body)
end

function A.with_identity(agent, fn)
    local path = A.abspath(A.out .. "/identity.config")
    local function git_quote(s)
        return '"' .. tostring(s):gsub("\\", "\\\\"):gsub('"', '\\"') .. '"'
    end
    A.write(path, "[user]\n\tname = " .. git_quote(agent.name) .. "\n\temail = " .. git_quote(agent.email) .. "\n")
    local prev = A.trim((A.capture({ "git", "config", "--local", "--get", "include.path" })))
    local code = A.run({ "git", "config", "--local", "include.path", path })
    if code ~= 0 then return code end
    local ok, result = pcall(fn)
    if prev ~= "" then
        A.run({ "git", "config", "--local", "include.path", prev })
    else
        A.run({ "git", "config", "--local", "--unset", "include.path" })
    end
    if not ok then error(result, 0) end
    return result
end

return A
