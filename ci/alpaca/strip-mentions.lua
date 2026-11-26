local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local path = A.out .. "/comment.md"
local text = A.read(path)
if not text then A.die("comment.md is missing") end
for _, agent in ipairs(A.agents()) do
    local login = tostring(agent.login)
    local low = text:lower()
    local needle = "@" .. login:lower()
    local out = {}
    local from = 1
    while true do
        local at = low:find(needle, from, true)
        if not at then
            out[#out + 1] = text:sub(from)
            break
        end
        out[#out + 1] = text:sub(from, at - 1)
        out[#out + 1] = text:sub(at + 1, at + #login)
        from = at + 1 + #login
    end
    text = table.concat(out)
end
if arg[1] ~= "quiet" then
    text = text .. "\r\n\r\nПока шло это задание, появилось новое обращение. Сначала разбирается оно.\r\n"
end
A.write(path, text)
os.exit(0)
