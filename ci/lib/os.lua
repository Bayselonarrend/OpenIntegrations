-- Lua 5.1 helpers for scripts that run on Windows and Unix.
local O = {
    windows = package.config:sub(1, 1) == "\\",
}

local seq = 0

function O.code(status)
    if status == true or status == 0 then return 0 end
    if status == false or status == nil then return 1 end
    if type(status) == "number" then
        if status < 0 then return 1 end
        if status > 255 then return math.floor(status / 256) % 256 end
        return status
    end
    return 1
end

function O.die(msg)
    io.stderr:write(tostring(msg) .. "\n")
    os.exit(1)
end

function O.quote(s)
    s = tostring(s)
    if O.windows then
        return '"' .. s:gsub('"', '""') .. '"'
    end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end

function O.argv(args)
    local parts = {}
    for i = 1, #args do parts[i] = O.quote(args[i]) end
    return table.concat(parts, " ")
end

function O.exec(line)
    if O.windows then
        return O.code(os.execute("set GIT_TERMINAL_PROMPT=0& " .. line))
    end
    return O.code(os.execute("GIT_TERMINAL_PROMPT=0 " .. line))
end

function O.run(args)
    return O.exec(O.argv(args))
end

function O.trim(s)
    return (tostring(s or ""):gsub("^%s+", ""):gsub("%s+$", ""))
end

function O.env(name)
    return os.getenv(name) or ""
end

function O.lines(text)
    local rows = {}
    text = tostring(text or ""):gsub("\r\n", "\n"):gsub("\r", "\n")
    local start = 1
    while true do
        local nl = text:find("\n", start, true)
        if not nl then
            local last = text:sub(start)
            if last ~= "" then rows[#rows + 1] = last end
            break
        end
        rows[#rows + 1] = text:sub(start, nl - 1)
        start = nl + 1
    end
    return rows
end

function O.isfile(path)
    local f = io.open(path, "rb")
    if f then f:close() return true end
    return false
end

function O.isdir(path)
    path = tostring(path or ""):gsub("[/\\]+$", "")
    if path == "" then return false end
    local line
    if O.windows then
        line = "pushd " .. O.quote(path) .. " >nul 2>&1 && popd && echo DIR"
    else
        line = "test -d " .. O.quote(path) .. " && echo DIR"
    end
    local p = io.popen(line, "r")
    if not p then return false end
    local text = p:read("*a") or ""
    p:close()
    return text:find("DIR", 1, true) ~= nil
end

function O.mkdirs(path)
    path = tostring(path or ""):gsub("\\", "/")
    if path == "" or O.isdir(path) then return end
    if O.windows then
        O.exec("mkdir " .. O.quote(path))
    else
        O.exec("mkdir -p " .. O.quote(path))
    end
end

function O.read(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local text = f:read("*a") or ""
    f:close()
    return text
end

function O.write(path, text)
    local parent = tostring(path):gsub("\\", "/"):match("^(.*)/[^/]+$")
    if parent and parent ~= "" then O.mkdirs(parent) end
    local f = io.open(path, "wb")
    if not f then O.die("Cannot write " .. tostring(path)) end
    f:write(text)
    f:close()
end

function O.temp(tag)
    seq = seq + 1
    local base = O.env("TEMP")
    if base == "" then base = O.env("TMPDIR") end
    if base == "" then base = "/tmp" end
    return base:gsub("\\", "/") .. "/oi-" .. tag .. "-" .. seq .. ".txt"
end

function O.capture(args)
    local path = O.temp("cap")
    local code = O.exec(O.argv(args) .. " > " .. O.quote(path) .. " 2>&1")
    local text = O.read(path) or ""
    os.remove(path)
    return text, code
end

function O.capture_line(line)
    local path = O.temp("cap")
    local code = O.exec(line .. " > " .. O.quote(path) .. " 2>&1")
    local text = O.read(path) or ""
    os.remove(path)
    return text, code
end

function O.sleep(seconds)
    seconds = tonumber(seconds) or 1
    if seconds < 1 then seconds = 1 end
    if O.windows then
        os.execute("ping -n " .. math.floor(seconds + 1) .. " 127.0.0.1 > nul")
    else
        os.execute("sleep " .. math.floor(seconds))
    end
end

function O.norm(path)
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

function O.cwd()
    local path = O.temp("cwd")
    local code = O.exec((O.windows and "cd" or "pwd") .. " > " .. O.quote(path))
    if code ~= 0 then O.die("cwd failed with " .. tostring(code)) end
    local text = O.trim(O.read(path) or "")
    os.remove(path)
    return text:gsub("\\", "/")
end

function O.abspath(path)
    path = tostring(path or ""):gsub("\\", "/")
    local rooted = path:match("^%a:/") or path:match("^/")
    if not rooted then
        local cwd = O.cwd()
        if cwd:sub(-1) ~= "/" then cwd = cwd .. "/" end
        path = cwd .. path
    end
    return O.norm(path)
end

function O.repo()
    local text, code = O.capture({ "git", "rev-parse", "--show-toplevel" })
    if code ~= 0 then O.die("git rev-parse failed: " .. O.trim(text)) end
    return O.trim(text):gsub("\\", "/")
end

local function relative(root, full)
    root = root:gsub("\\", "/"):gsub("/+$", "")
    full = full:gsub("\\", "/")
    local prefix = root .. "/"
    if O.windows then
        if full:sub(1, #prefix):lower() == prefix:lower() then
            return full:sub(#prefix + 1)
        end
    elseif full:sub(1, #prefix) == prefix then
        return full:sub(#prefix + 1)
    end
    return nil
end

function O.listfiles(path, recursive)
    path = O.abspath(path)
    if not O.isdir(path) then return {} end
    local text, code
    if O.windows then
        local flag = recursive and "/s " or ""
        text, code = O.capture_line("cmd /d /c dir /b " .. flag .. "/a-d " .. O.quote(path))
    else
        local depth = recursive and "" or " -maxdepth 1"
        text, code = O.capture_line("find " .. O.quote(path) .. depth .. " -type f")
    end
    if code ~= 0 and O.trim(text) == "" then return {} end
    local names = {}
    for _, row in ipairs(O.lines(text)) do
        local rel = relative(path, row)
        if not rel and not recursive then
            rel = row:gsub("\\", "/"):match("([^/]+)$")
        end
        if rel and rel ~= "" then names[#names + 1] = rel end
    end
    return names
end

function O.listdirs(path)
    path = O.abspath(path)
    if not O.isdir(path) then return {} end
    local text, code
    if O.windows then
        text, code = O.capture_line("cmd /d /c dir /b /ad " .. O.quote(path))
    else
        text, code = O.capture_line("find " .. O.quote(path) .. " -mindepth 1 -maxdepth 1 -type d")
    end
    if code ~= 0 and O.trim(text) == "" then return {} end
    local names = {}
    for _, row in ipairs(O.lines(text)) do
        local name = row:gsub("\\", "/"):match("([^/]+)$")
        if name and name ~= "" and name ~= "." and name ~= ".." then
            names[#names + 1] = name
        end
    end
    return names
end

function O.copy(src, dst)
    local parent = tostring(dst):gsub("\\", "/"):match("^(.*)/[^/]+$")
    if parent and parent ~= "" then O.mkdirs(parent) end
    local input = io.open(src, "rb")
    if not input then O.die("Cannot read " .. tostring(src)) end
    local output = io.open(dst, "wb")
    if not output then
        input:close()
        O.die("Cannot write " .. tostring(dst))
    end
    while true do
        local chunk = input:read(1024 * 64)
        if not chunk then break end
        output:write(chunk)
    end
    input:close()
    output:close()
end

function O.mirror(src, dst)
    src = O.abspath(src)
    dst = O.abspath(dst)
    if not O.isdir(src) then O.die("Source directory not found: " .. src) end
    O.mkdirs(dst)
    local keep = {}
    for _, rel in ipairs(O.listfiles(src, true)) do
        O.copy(src .. "/" .. rel, dst .. "/" .. rel)
        keep[rel:gsub("\\", "/")] = true
    end
    for _, rel in ipairs(O.listfiles(dst, true)) do
        rel = rel:gsub("\\", "/")
        if not keep[rel] then os.remove(dst .. "/" .. rel) end
    end
end

function O.listeners(port)
    port = tostring(port)
    local text
    if O.windows then
        text = O.capture({ "netstat", "-ano" })
    else
        local listed, code = O.capture_line("ss -ltnp 2>/dev/null")
        if code ~= 0 or O.trim(listed) == "" then
            listed = O.capture_line("netstat -ltnp 2>/dev/null")
        end
        text = listed
    end
    local found, seen = {}, {}
    for _, row in ipairs(O.lines(text)) do
        if row:find("[^:]:" .. port .. "[^%d]") or row:find("^:" .. port .. "[^%d]") then
            local pid
            if row:find("LISTEN") then
                pid = row:match("(%d+)%s*$") or row:match("pid=(%d+)")
            end
            if pid and not seen[pid] and tonumber(pid) > 4 then
                seen[pid] = true
                found[#found + 1] = pid
            end
        end
    end
    return found
end

function O.kill(pid)
    pid = tostring(pid)
    if O.windows then
        O.run({ "taskkill", "/F", "/PID", pid })
    else
        O.exec("kill -TERM " .. pid .. " >/dev/null 2>&1")
        O.exec("kill -KILL " .. pid .. " >/dev/null 2>&1")
    end
end

return O
