local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local verdict = A.read(A.out .. "/verdict.txt")
if not verdict then A.die("verdict.txt is missing") end
local line = nil
for _, row in ipairs(A.lines(verdict)) do
    if A.trim(row) ~= "" then
        line = row
        break
    end
end
if A.trim(line or "") ~= "approve" then os.exit(2) end

local pr = A.trim(A.read(A.out .. "/pr.txt") or "")
if not pr:match("^%d+$") then A.die("Bad PR number: " .. pr) end
local text = A.read(A.out .. "/comment.md")
if not text then A.die("comment.md is missing") end
text = A.trim(text)
if not text:find("<!-- alpaca -->", 1, true) then
    text = "<!-- alpaca -->\r\n\r\n" .. text
end
if #text > 60000 then text = A.clip(text, 60000) end
local payload = A.out .. "/approve.json"
A.write(payload, A.json.encode({ body = text, event = "APPROVE" }))
os.exit(A.run({
    "gh", "api", "--method", "POST",
    "repos/" .. A.repo .. "/pulls/" .. pr .. "/reviews",
    "--input", payload,
}))
