local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local function node(t, name)
    if type(t) ~= "table" or t == A.json.null then return nil end
    local value = t[name]
    if value == A.json.null then return nil end
    return value
end

local function mcp_block(config)
    return node(node(node(node(config, "ai"), "value"), "mcp"), "value")
end

local function git_show(spec)
    local text, code = A.capture({ "git", "show", spec })
    if code ~= 0 or text == "" then return nil end
    return text
end

local function collect(value, out)
    if type(value) == "string" then
        out[#out + 1] = value
    elseif type(value) == "table" and value ~= A.json.null then
        for _, item in pairs(value) do collect(item, out) end
    end
end

local function plain_replace(text, key, replacement)
    local out, i = {}, 1
    while true do
        local j = text:find(key, i, true)
        if not j then
            out[#out + 1] = text:sub(i)
            break
        end
        out[#out + 1] = text:sub(i, j - 1)
        out[#out + 1] = replacement
        i = j + #key
    end
    return table.concat(out)
end

local function resolve(path, root)
    local expanded = plain_replace(path, "${workspaceFolder}", root:gsub("\\", "/")):gsub("\\", "/")
    if not expanded:match("^%a:") and not expanded:match("^/") then
        expanded = root:gsub("\\", "/") .. "/" .. expanded:gsub("^%./", "")
    end
    return A.norm(expanded)
end

local function leaf(item)
    local text = plain_replace(item, "${workspaceFolder}", ""):gsub("\\", "/")
    return text:match("([^/]+)$") or ""
end

local function url_name(url)
    return url:gsub("%?.*$", ""):gsub("#.*$", ""):match("([^/]+)$")
end

local root = A.cwd()
local config = nil
local configPath = "ci/config_global.json"
if A.isfile(configPath) then
    config = A.decode(A.read(configPath), configPath)
end
local mcp = mcp_block(config)
local serversText = nil
if mcp then
    local serversRel = tostring(node(node(mcp, "serversFile"), "value") or "")
    if serversRel == "" then A.die("ai.mcp.serversFile is empty") end
    local serversPath = resolve(serversRel, root)
    if not A.isfile(serversPath) then A.die("mcpServers file not found: " .. serversPath) end
    serversText = A.read(serversPath)
else
    local mainConfig = git_show("origin/main:ci/config_global.json")
    if mainConfig then
        config = A.decode(mainConfig, "origin/main:ci/config_global.json")
        mcp = mcp_block(config)
    end
    if not mcp then
        print("MCP settings are absent, skip")
        os.exit(0)
    end
    local serversRel = tostring(node(node(mcp, "serversFile"), "value") or "")
    if serversRel == "" then A.die("ai.mcp.serversFile is empty") end
    local gitPath = serversRel:gsub("^%./", ""):gsub("\\", "/")
    serversText = git_show("origin/main:" .. gitPath)
    if not serversText then A.die("mcpServers file not found on origin/main: " .. gitPath) end
    print("MCP settings taken from origin/main")
end

local servers = A.decode(serversText, "mcpServers")
local strings = {}
collect(servers, strings)

local connected = serversText
if A.env("ALPACA_AGENT") ~= "" then
    local agent = A.agent(A.env("ALPACA_AGENT"))
    local agentMcp = A.root .. "/agents/" .. agent.id .. "/mcp.json"
    if not A.isfile(agentMcp) then A.die("agent mcp.json not found: " .. agentMcp) end
    connected = A.read(agentMcp)
    print("MCP config: " .. agent.id)
end

A.mkdirs(".cursor")
A.write(".cursor/mcp.json", connected)
A.mkdirs(A.out .. "/cursor-config")
local rootUrl = root:gsub("\\", "/")
A.write(A.out .. "/cursor-config/mcp.json", plain_replace(connected, "${workspaceFolder}", rootUrl))

local downloads = node(node(mcp, "downloads"), "value")
if type(downloads) ~= "table" or downloads == A.json.null then downloads = {} end
for _, url in ipairs(downloads) do
    if type(url) == "string" and url ~= "" then
        local name = url_name(url)
        if not name or name == "" then A.die("URL has no file name: " .. url) end
        local match = nil
        for _, item in ipairs(strings) do
            if leaf(item) == name then
                match = item
                break
            end
        end
        if not match then A.die("mcpServers has no path for " .. name) end
        local dest = resolve(match, root)
        if A.isfile(dest) and (A.filesize(dest) or 0) > 0 then
            print("MCP file present: " .. dest)
        else
            local parent = dest:match("^(.*)/[^/]+$")
            if parent then A.mkdirs(parent) end
            local part = dest .. ".part"
            os.remove(part)
            print("Downloading " .. url)
            local code = A.run({
                "curl", "-fsSL", "--retry", "2", "--max-time", "300", "-o", part, url,
            })
            if code ~= 0 or not A.isfile(part) or (A.filesize(part) or 0) == 0 then
                A.die("Empty download: " .. url)
            end
            os.remove(dest)
            if not os.rename(part, dest) then A.die("Could not save " .. dest) end
            print("MCP file saved: " .. dest)
        end
    end
end
os.exit(0)
