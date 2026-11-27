-- Decrypt, edit, and encrypt test secrets in data.sqlite.gpg.
-- Passphrase: environment variable GPGKEY. It is not printed.
-- Value for `set` comes from stdin, not from the command line.

local windows = package.config:sub(1, 1) == "\\"

local function die(msg)
    io.stderr:write(tostring(msg) .. "\n")
    os.exit(1)
end

local function quote(s)
    s = tostring(s)
    if windows then
        return '"' .. s:gsub('"', '""') .. '"'
    end
    return "'" .. s:gsub("'", "'\\''") .. "'"
end

local function code(status)
    if status == true or status == 0 then return 0 end
    if status == false or status == nil then return 1 end
    if type(status) == "number" then
        if status < 0 then return 1 end
        if status > 255 then return math.floor(status / 256) % 256 end
        return status
    end
    return 1
end

local function run(line)
    return code(os.execute(line))
end

local function exists(path)
    local f = io.open(path, "rb")
    if not f then return false end
    f:close()
    return true
end

local function read_file(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local text = f:read("*a") or ""
    f:close()
    return text
end

local function write_file(path, text)
    local f = assert(io.open(path, "wb"))
    f:write(text)
    f:close()
end

local function find_root()
    if exists("data.sqlite.gpg") then return "." end
    local src = (arg[0] or ""):gsub("\\", "/")
    local dir = src:match("^(.*)/[^/]+$") or ""
    local parent = dir:match("^(.*)/ci$")
    if parent and parent ~= "" and exists(parent .. "/data.sqlite.gpg") then
        return parent
    end
    die("data.sqlite.gpg not found. Run from the repository root.")
end

local root = find_root()
local gpg_path = root .. "/data.sqlite.gpg"
local db_path = root .. "/data.sqlite"

local function sql_quote(s)
    return "'" .. tostring(s):gsub("'", "''") .. "'"
end

local function key_ok(key)
    return type(key) == "string" and key:match("^[%w_]+$") ~= nil
end

local function capture(line)
    local out = os.tmpname()
    local status = run(line .. " > " .. quote(out))
    local text = read_file(out) or ""
    os.remove(out)
    return text, status
end

local function sqlite(sql)
    if not exists(db_path) then
        die("data.sqlite is missing. Run decrypt first.")
    end
    local query = os.tmpname()
    write_file(query, sql)
    local text, status = capture("sqlite3 " .. quote(db_path) .. " < " .. quote(query))
    os.remove(query)
    if status ~= 0 then
        die("sqlite3 failed. It must be available as sqlite3 in PATH.")
    end
    return text
end

local function redact(text, pass)
    text = tostring(text)
    if pass == "" then return text end
    local pattern = pass:gsub("(%W)", "%%%1")
    return (text:gsub(pattern, "***"))
end

local function gpg(passfile, args)
    local common = "gpg --quiet --batch --yes "
    local attempts = {
        common .. "--pinentry-mode loopback --passphrase-file " .. quote(passfile) .. " " .. args,
        common .. "--passphrase-file " .. quote(passfile) .. " " .. args,
    }
    local pass = read_file(passfile) or ""
    attempts[3] = common .. "--passphrase=" .. quote(pass) .. " " .. args
    local status = 1
    for i = 1, #attempts do
        status = run(attempts[i])
        if status == 0 then return end
    end
    error("gpg failed", 0)
end

local function with_pass(fn)
    local pass = os.getenv("GPGKEY") or ""
    if pass == "" then
        return false, "GPGKEY is empty"
    end
    local path = os.tmpname()
    write_file(path, pass)
    local ok, err = pcall(fn, path)
    os.remove(path)
    if not ok then
        return false, redact(err, pass)
    end
    return true
end

local function replace_file(tmp, dest)
    local body = read_file(tmp)
    if body == nil then
        die("missing temporary file")
    end
    write_file(dest, body)
    os.remove(tmp)
end

local function decrypt()
    if not exists(gpg_path) then die("data.sqlite.gpg not found") end
    local tmp = db_path .. ".tmp"
    os.remove(tmp)
    local ok, err = with_pass(function(passfile)
        gpg(passfile, "--decrypt --output " .. quote(tmp) .. " " .. quote(gpg_path))
    end)
    if not ok or not exists(tmp) then
        os.remove(tmp)
        die(err or "gpg failed")
    end
    replace_file(tmp, db_path)
    print("decrypted")
end

local function encrypt()
    if not exists(db_path) then die("data.sqlite is missing. Run decrypt first.") end
    local tmp = gpg_path .. ".tmp"
    os.remove(tmp)
    local ok, err = with_pass(function(passfile)
        gpg(passfile, "--symmetric --cipher-algo AES256 --output " .. quote(tmp) .. " " .. quote(db_path))
    end)
    if not ok or not exists(tmp) then
        os.remove(tmp)
        die(err or "gpg failed")
    end
    replace_file(tmp, gpg_path)
    print("encrypted")
end

local function keys()
    local text = sqlite("SELECT key || char(9) || type FROM test_params ORDER BY key;")
    io.write(text)
    if text ~= "" and text:sub(-1) ~= "\n" then io.write("\n") end
end

local function get(key)
    if not key_ok(key) then die("key must match [%w_]+") end
    local text = sqlite("SELECT value FROM test_params WHERE key = " .. sql_quote(key) .. ";")
    text = text:gsub("\r\n$", ""):gsub("\n$", "")
    if text == "" then die("unknown key") end
    io.write(text)
    if text:sub(-1) ~= "\n" then io.write("\n") end
end

local function stdin_value()
    local value = io.read("*a") or ""
    if value:sub(-2) == "\r\n" then
        value = value:sub(1, -3)
    elseif value:sub(-1) == "\n" then
        value = value:sub(1, -2)
    end
    return value
end

local function set(key, kind)
    if not key_ok(key) then die("key must match [%w_]+") end
    if kind == nil or kind == "" then kind = "String" end
    if kind ~= "String" and kind ~= "Number" then die("type is String or Number") end
    local value = stdin_value()
    if kind == "Number" and value:match("^%-?%d+%.?%d*$") == nil then
        die("Number value is not numeric")
    end
    local count = sqlite("SELECT count(*) FROM test_params WHERE key = " .. sql_quote(key) .. ";")
    count = count:gsub("%s+", "")
    if count == "0" then
        sqlite("INSERT INTO test_params (key, value, type) VALUES ("
            .. sql_quote(key) .. ", " .. sql_quote(value) .. ", " .. sql_quote(kind) .. ");")
    else
        sqlite("UPDATE test_params SET value = " .. sql_quote(value)
            .. ", type = " .. sql_quote(kind)
            .. " WHERE key = " .. sql_quote(key) .. ";")
    end
    print("updated " .. key)
end

local function usage()
    die("usage: lua ci/secret-data.lua decrypt|encrypt|keys|get KEY|set KEY [String|Number]")
end

local cmd = arg[1]
if cmd == "decrypt" then
    decrypt()
elseif cmd == "encrypt" then
    encrypt()
elseif cmd == "keys" then
    keys()
elseif cmd == "get" then
    if not arg[2] then usage() end
    get(arg[2])
elseif cmd == "set" then
    if not arg[2] then usage() end
    set(arg[2], arg[3])
else
    usage()
end
