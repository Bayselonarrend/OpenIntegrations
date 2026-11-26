local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local bodyFile = arg[1]
local target = arg[2] or "pr"
if target ~= "pr" and target ~= "issue" then A.die("Bad comment target: " .. tostring(target)) end
if not bodyFile or not A.isfile(bodyFile) then A.die("Comment file not found: " .. tostring(bodyFile)) end

local args
if target == "issue" then
    args = { "gh", "issue", "comment", A.issue() }
else
    local pr = A.trim(A.read(A.out .. "/pr.txt") or "")
    if not pr:match("^%d+$") then A.die("Bad PR number: " .. pr) end
    args = { "gh", "pr", "comment", pr }
end

local text = A.read(bodyFile)
if not text:find("<!-- alpaca -->", 1, true) then
    text = "<!-- alpaca -->\r\n\r\n" .. text
end
if #text > 60000 then text = A.clip(text, 60000) .. "\r\n..." end
local post = A.out .. "/comment-post.md"
A.write(post, text)
args[#args + 1] = "--repo"
args[#args + 1] = A.repo
args[#args + 1] = "--body-file"
args[#args + 1] = post
os.exit(A.run(args))
