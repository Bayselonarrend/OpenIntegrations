-- JSON encode/decode for Lua 5.1. Objects stay objects; arrays keep their shape.
local json = {}
local null = {}
json.null = null

local array_mt = { __jsontype = "array" }

local function utf8_char(cp)
    if not cp or cp < 0 then return "?" end
    if cp < 0x80 then
        return string.char(cp)
    elseif cp < 0x800 then
        return string.char(0xC0 + math.floor(cp / 0x40), 0x80 + (cp % 0x40))
    elseif cp < 0x10000 then
        return string.char(
            0xE0 + math.floor(cp / 0x1000),
            0x80 + (math.floor(cp / 0x40) % 0x40),
            0x80 + (cp % 0x40))
    end
    return string.char(
        0xF0 + math.floor(cp / 0x40000),
        0x80 + (math.floor(cp / 0x1000) % 0x40),
        0x80 + (math.floor(cp / 0x40) % 0x40),
        0x80 + (cp % 0x40))
end

local function skip(s, i)
    while i <= #s do
        local c = s:sub(i, i)
        if c ~= " " and c ~= "\t" and c ~= "\r" and c ~= "\n" then break end
        i = i + 1
    end
    return i
end

local parse_value

local function parse_string(s, i)
    local out = {}
    i = i + 1
    while i <= #s do
        local c = s:sub(i, i)
        if c == '"' then
            return table.concat(out), i + 1
        elseif c == "\\" then
            local e = s:sub(i + 1, i + 1)
            if e == "n" then out[#out + 1] = "\n"; i = i + 2
            elseif e == "r" then out[#out + 1] = "\r"; i = i + 2
            elseif e == "t" then out[#out + 1] = "\t"; i = i + 2
            elseif e == "b" then out[#out + 1] = "\b"; i = i + 2
            elseif e == "f" then out[#out + 1] = "\f"; i = i + 2
            elseif e == '"' or e == "\\" or e == "/" then out[#out + 1] = e; i = i + 2
            elseif e == "u" then
                local hex = s:sub(i + 2, i + 5)
                if not hex:match("^%x%x%x%x$") then error("bad unicode escape") end
                out[#out + 1] = utf8_char(tonumber(hex, 16))
                i = i + 6
            else
                error("bad escape")
            end
        else
            out[#out + 1] = c
            i = i + 1
        end
    end
    error("unterminated string")
end

local function parse_number(s, i)
    local rest = s:sub(i)
    local token = rest:match("^-?%d+%.?%d*[eE][+-]?%d+") or rest:match("^-?%d+%.?%d*")
    if not token or token == "-" then error("bad number at " .. i) end
    local n = tonumber(token)
    if not n then error("bad number at " .. i) end
    return n, i + #token
end

local function parse_array(s, i)
    i = skip(s, i + 1)
    local t = {}
    if s:sub(i, i) == "]" then
        return setmetatable(t, array_mt), i + 1
    end
    local n = 0
    while true do
        local v
        v, i = parse_value(s, i)
        n = n + 1
        t[n] = v
        i = skip(s, i)
        local c = s:sub(i, i)
        if c == "]" then
            return setmetatable(t, array_mt), i + 1
        elseif c ~= "," then
            error("bad array at " .. i)
        end
        i = skip(s, i + 1)
    end
end

local function parse_object(s, i)
    i = skip(s, i + 1)
    local t = {}
    if s:sub(i, i) == "}" then
        return t, i + 1
    end
    while true do
        if s:sub(i, i) ~= '"' then error("bad object key at " .. i) end
        local key
        key, i = parse_string(s, i)
        i = skip(s, i)
        if s:sub(i, i) ~= ":" then error("colon expected at " .. i) end
        i = skip(s, i + 1)
        local v
        v, i = parse_value(s, i)
        t[key] = v
        i = skip(s, i)
        local c = s:sub(i, i)
        if c == "}" then
            return t, i + 1
        elseif c ~= "," then
            error("bad object at " .. i)
        end
        i = skip(s, i + 1)
    end
end

function parse_value(s, i)
    i = skip(s, i)
    local c = s:sub(i, i)
    if c == '"' then return parse_string(s, i) end
    if c == "{" then return parse_object(s, i) end
    if c == "[" then return parse_array(s, i) end
    if c == "t" and s:sub(i, i + 3) == "true" then return true, i + 4 end
    if c == "f" and s:sub(i, i + 4) == "false" then return false, i + 5 end
    if c == "n" and s:sub(i, i + 3) == "null" then return null, i + 4 end
    if c == "-" or c:match("%d") then return parse_number(s, i) end
    error("bad value at " .. i)
end

function json.decode(s)
    if type(s) ~= "string" then error("json.decode expects a string") end
    local value, i = parse_value(s, 1)
    i = skip(s, i)
    if i <= #s then error("trailing data at " .. i) end
    return value
end

local encode_value

local function is_array(t)
    if getmetatable(t) == array_mt then return true end
    local n, max = 0, 0
    for k in pairs(t) do
        if type(k) ~= "number" or k < 1 or k ~= math.floor(k) then return false end
        n = n + 1
        if k > max then max = k end
    end
    return n > 0 and max == n
end

local function encode_string(s)
    local out = { '"' }
    for i = 1, #s do
        local b = s:byte(i)
        if b == 34 then out[#out + 1] = '\\"'
        elseif b == 92 then out[#out + 1] = "\\\\"
        elseif b == 8 then out[#out + 1] = "\\b"
        elseif b == 9 then out[#out + 1] = "\\t"
        elseif b == 10 then out[#out + 1] = "\\n"
        elseif b == 12 then out[#out + 1] = "\\f"
        elseif b == 13 then out[#out + 1] = "\\r"
        elseif b < 32 then out[#out + 1] = string.format("\\u%04x", b)
        else out[#out + 1] = string.char(b)
        end
    end
    out[#out + 1] = '"'
    return table.concat(out)
end

function encode_value(v)
    local tv = type(v)
    if v == null or tv == "nil" then return "null" end
    if tv == "boolean" then return v and "true" or "false" end
    if tv == "number" then
        if v ~= v or v == math.huge or v == -math.huge then error("bad number") end
        if v == math.floor(v) and math.abs(v) < 1e15 then
            return string.format("%.0f", v)
        end
        return string.format("%.14g", v)
    end
    if tv == "string" then return encode_string(v) end
    if tv ~= "table" then error("cannot encode " .. tv) end
    if is_array(v) then
        local parts = {}
        for i = 1, #v do parts[i] = encode_value(v[i]) end
        return "[" .. table.concat(parts, ",") .. "]"
    end
    local parts = {}
    for k, item in pairs(v) do
        if type(k) ~= "string" then error("object key must be a string") end
        parts[#parts + 1] = encode_string(k) .. ":" .. encode_value(item)
    end
    return "{" .. table.concat(parts, ",") .. "}"
end

function json.encode(v)
    return encode_value(v)
end

return json
