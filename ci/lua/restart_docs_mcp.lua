local O = dofile("./ci/lib/os.lua")

local function text(value)
    value = tostring(value or "")
    if value == "nil" or value == "null" then return "" end
    return value
end

function restart_docs_mcp(index, port, server, node, bind, hosts)
    index = text(index)
    port = text(port)
    server = text(server)
    node = text(node)
    bind = text(bind)
    hosts = text(hosts)
    if bind == "" then bind = "127.0.0.1" end
    if hosts == "" then hosts = "127.0.0.1,localhost" end

    if index == "" then error("MCP index path is empty") end
    if port == "" or not port:match("^%d+$") then error("MCP port is empty") end
    if server == "" then error("MCP server directory is empty") end
    if node == "" then error("node path is empty") end
    if not O.isfile(index) then error("MCP index not found: " .. index) end
    if not O.isfile(node) then error("node not found: " .. node) end
    if not O.isdir(server) then error("MCP server directory not found: " .. server) end

    for _, pid in ipairs(O.listeners(port)) do
        O.kill(pid)
        print("Stopped listener " .. pid .. " on port " .. port)
    end
    O.sleep(1)

    local logDir = (O.env("TEMP") ~= "" and O.env("TEMP") or (O.env("TMPDIR") ~= "" and O.env("TMPDIR") or "/tmp"))
    logDir = logDir:gsub("\\", "/") .. "/openintegrations-docs-mcp"
    O.mkdirs(logDir)
    local log = logDir .. "/port-" .. port .. ".log"
    os.remove(log)

    local function cmd_quote(s)
        return '"' .. tostring(s):gsub('"', '""') .. '"'
    end

    if O.windows then
        local runner = logDir .. "/run-mcp-" .. port .. ".cmd"
        O.write(runner, table.concat({
            "@echo off",
            "set " .. cmd_quote("MCP_INDEX=" .. index),
            "set " .. cmd_quote("MCP_HOST=" .. bind),
            "set " .. cmd_quote("PORT=" .. port),
            "set " .. cmd_quote("MCP_ALLOWED_HOSTS=" .. hosts),
            cmd_quote(node) .. " server.mjs >> " .. cmd_quote(log) .. " 2>&1",
        }, "\r\n") .. "\r\n")
        local vbs = logDir .. "/run-mcp-" .. port .. ".vbs"
        O.write(vbs, table.concat({
            'Set sh = CreateObject("WScript.Shell")',
            "sh.CurrentDirectory = WScript.Arguments(0)",
            'sh.Run "cmd.exe /d /c """ & WScript.Arguments(1) & """", 0, False',
            "",
        }, "\r\n"))
        local code = O.exec("cscript //nologo " .. O.quote(vbs) .. " " .. O.quote(server) .. " " .. O.quote(runner))
        if code ~= 0 then error("Failed to start docs MCP: " .. tostring(code)) end
    else
        local script = logDir .. "/run-mcp-" .. port .. ".sh"
        O.write(script, table.concat({
            "#!/bin/sh",
            "cd " .. O.quote(server) .. " || exit 1",
            "export MCP_INDEX=" .. O.quote(index),
            "export MCP_HOST=" .. O.quote(bind),
            "export PORT=" .. O.quote(port),
            "export MCP_ALLOWED_HOSTS=" .. O.quote(hosts),
            "exec " .. O.quote(node) .. " server.mjs >> " .. O.quote(log) .. " 2>&1",
            "",
        }, "\n"))
        local launch = "nohup sh " .. O.quote(script) .. " >/dev/null 2>&1 &"
        if O.exec("command -v setsid >/dev/null 2>&1") == 0 then
            launch = "setsid sh " .. O.quote(script) .. " >/dev/null 2>&1 &"
        end
        if O.exec(launch) ~= 0 then error("Failed to start docs MCP") end
    end

    print("Started docs MCP on " .. bind .. ":" .. port)

    local probe = bind
    if bind == "0.0.0.0" or bind == "::" then probe = "127.0.0.1" end
    local url = "http://" .. probe .. ":" .. port .. "/health"
    local healthy = false
    for _ = 1, 20 do
        if O.run({ "curl", "-fsS", "--max-time", "2", url }) == 0 then
            healthy = true
            break
        end
        O.sleep(1)
    end
    if not healthy then
        error("Docs MCP did not answer on port " .. port .. ". Log: " .. log .. "\n" .. (O.read(log) or ""))
    end
    print("Docs MCP health ok on port " .. port)
    return true
end
