local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local job, number, lines, outfile = arg[1], arg[2], tonumber(arg[3] or "500"), arg[4]
if not job or not job:match("^[A-Za-z0-9_./]+$") then A.die("Bad job name: " .. tostring(job)) end
if not number or not number:match("^%d+$") then A.die("Bad build number: " .. tostring(number)) end
if not lines or lines < 1 or lines > 5000 then A.die("Bad line count: " .. tostring(arg[3])) end
if not outfile or outfile == "" then A.die("Bad output file") end

local function jenkins_home()
    return A.jenkins_home()
end

local function last_lines(text)
    local rows = A.lines(text or "")
    if #rows <= lines then return table.concat(rows, "\n") end
    local cut = {}
    for i = #rows - lines + 1, #rows do cut[#cut + 1] = rows[i] end
    return table.concat(cut, "\n")
end

local function tail_file(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local size = f:seek("end") or 0
    local take = size
    if take > 2097152 then take = 2097152 end
    f:seek("set", size - take)
    local text = f:read("*a") or ""
    f:close()
    return last_lines(text)
end

local text = nil
local home = jenkins_home()
if home then
    local parts = {}
    for seg in job:gmatch("[^/]+") do
        parts[#parts + 1] = "jobs"
        parts[#parts + 1] = seg
    end
    parts[#parts + 1] = "builds"
    parts[#parts + 1] = number
    parts[#parts + 1] = "log"
    local logPath = home:gsub("[/\\]+$", "") .. "/" .. table.concat(parts, "/")
    if A.isfile(logPath) then text = tail_file(logPath) end
end

if not text or text == "" then
    local jobPath = {}
    for seg in job:gmatch("[^/]+") do jobPath[#jobPath + 1] = "job/" .. seg end
    local rel = table.concat(jobPath, "/")
    for _, base in ipairs({ "http://127.0.0.1:8080", "http://100.74.74.9:8080" }) do
        local body, code = A.capture({
            "curl", "-fsS", "--max-time", "60", base .. "/" .. rel .. "/" .. number .. "/consoleText",
        })
        if code == 0 and A.trim(body) ~= "" then
            text = last_lines(body)
            break
        end
    end
end

if not text or A.trim(text) == "" then A.die("log unavailable for " .. job .. " #" .. number) end
A.write(outfile, (text:gsub("%s+$", "")) .. "\n")
os.exit(0)
