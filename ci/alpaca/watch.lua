local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")
local T = dofile(A.lib .. "/targets.lua")(A)

local function fwd(path)
    return (tostring(path or ""):gsub("\\", "/"))
end

local function jenkins_home()
    return A.jenkins_home()
end

local function add_jobs(dir, bag)
    local jobs = dir .. "/jobs"
    if not A.isdir(jobs) then return end
    for _, name in ipairs(A.listdirs(jobs)) do
        local child = jobs .. "/" .. name
        if A.isdir(child .. "/builds") then bag[#bag + 1] = child end
        add_jobs(child, bag)
    end
end

local function job_name(rootDir, jobDir)
    local rel = fwd(jobDir):sub(#fwd(rootDir) + 1):gsub("^/+", "")
    local parts = {}
    for seg in rel:gmatch("[^/]+") do
        if seg ~= "jobs" then parts[#parts + 1] = seg end
    end
    return table.concat(parts, "/")
end

local function other_jobs()
    local home = jenkins_home()
    if not home then error("Jenkins home not found") end
    local dirs = {}
    add_jobs(home, dirs)
    local selfName = A.env("JOB_NAME")
    local selfNumber = A.env("BUILD_NUMBER")
    local found = {}
    for _, jobDir in ipairs(dirs) do
        local perms = jobDir .. "/builds/permalinks"
        if A.isfile(perms) then
            local lastBuild, lastCompleted = 0, 0
            for _, line in ipairs(A.lines(A.read(perms))) do
                local build = line:match("^lastBuild%s+(%d+)%s*$")
                local completed = line:match("^lastCompletedBuild%s+(-?%d+)%s*$")
                if build then lastBuild = tonumber(build) end
                if completed then lastCompleted = tonumber(completed) end
            end
            if lastBuild >= 1 and lastBuild ~= lastCompleted then
                local name = job_name(home, jobDir)
                if not (name == selfName and tostring(lastBuild) == selfNumber) then
                    found[#found + 1] = name .. " #" .. lastBuild
                end
            end
        end
    end
    return found
end

local function author_busy(running)
    for _, row in ipairs(running) do
        local name = row:gsub("%s+#%d+$", "")
        if not name:find("AlpacaWatch", 1, true)
            and not name:find("AlpacaAddins", 1, true)
            and not name:find("AlpacaReview", 1, true) then
            return true
        end
    end
    return false
end

local function reviewer_busy(agent, running)
    for _, row in ipairs(running) do
        if row:gsub("%s+#%d+$", "") == tostring(agent.job) then return true end
    end
    return false
end

local function wake_any(agent, stamps, fallback)
    local latest = A.latest_start(agent, stamps) or fallback
    local directive = A.latest_directive(stamps)
    for _, stamp in ipairs(stamps) do
        if A.wakes(agent, stamp, latest, directive) then return true end
    end
    return false
end

local function writer_busy(running)
    for _, row in ipairs(running) do
        local name = row:gsub("%s+#%d+$", "")
        if name:find("AlpacaWork", 1, true)
            or name:find("AlpacaTest", 1, true)
            or name:find("AlpacaAnalyze", 1, true)
            or name:find("BigFloppa", 1, true) then
            return true
        end
    end
    return false
end

A.rmtree(A.out)
A.mkdirs(A.out)

local ok, running = pcall(other_jobs)
if not ok then
    print("Cannot see running Jenkins jobs, cycle not started: " .. tostring(running))
    os.exit(0)
end

local triggered = {}

local function write_trigger(agent, issue, reason)
    A.write(
        A.out .. "/trigger-" .. agent.id .. ".properties",
        "agent=" .. agent.id .. "\r\nissue=" .. tostring(issue)
            .. "\r\nreason=" .. reason .. "\r\njob=" .. tostring(agent.job) .. "\r\n")
    triggered[#triggered + 1] = tostring(agent.id)
    print("trigger agent=" .. agent.id .. " issue=" .. tostring(issue) .. " reason=" .. reason)
end

local function writer(agent)
    return A.ieq(agent.role, "author") or A.ieq(agent.role, "tester") or A.ieq(agent.role, "analyst")
end

local claimed = {}
local stampCache = {}

local function stamps_of(issueNumber, pullNumber)
    local key = tostring(issueNumber) .. ":" .. tostring(pullNumber)
    if stampCache[key] == nil then
        stampCache[key] = T.stamps(issueNumber, pullNumber)
    end
    return stampCache[key]
end

local function trigger_from(agent, issueNumber, pullNumber)
    if not wake_any(agent, stamps_of(issueNumber, pullNumber), nil) then return false end
    if writer(agent) and claimed[tostring(issueNumber)] then
        print("agent=" .. agent.id .. " skips issue " .. tostring(issueNumber)
            .. ", another writer is already triggered")
        return false
    end
    if A.ieq(agent.role, "reviewer") and claimed[tostring(issueNumber)] then
        print("agent=" .. agent.id .. " waits for issue " .. tostring(issueNumber)
            .. ", a writer is already triggered")
        return false
    end
    if writer(agent) then claimed[tostring(issueNumber)] = true end
    local reason = A.ieq(agent.role, "reviewer") and "review" or "comments"
    write_trigger(agent, issueNumber, reason)
    return true
end

-- Search can leave a new comment out of the index for well over an hour.
-- updated_at on the issues API moves as soon as the comment is posted.
local function fresh_items()
    local list = {}
    local recent = A.json_out({
        "gh", "api",
        "repos/" .. A.repo .. "/issues?state=open&sort=updated&direction=desc&per_page=20",
    }, "gh api issues")
    if type(recent) ~= "table" then return list end
    if recent[1] == nil then
        if type(recent.message) == "string" then A.die("gh api issues: " .. recent.message) end
        return list
    end
    for _, row in ipairs(recent) do
        if type(row) == "table" and row ~= A.json.null and tonumber(row.number) then
            local number = tonumber(row.number)
            local pull = type(row.pull_request) == "table" and row.pull_request ~= A.json.null
            if not pull then
                list[#list + 1] = { issue = number, pull = 0 }
            else
                local raw, code = A.capture({
                    "gh", "pr", "view", tostring(number), "--repo", A.repo,
                    "--json", "number,headRefName,state",
                })
                if code == 0 and A.trim(raw) ~= "" then
                    local pr = A.decode(raw, "gh pr view")
                    local issue = tostring(pr.headRefName or ""):match("^alpaca/(%d+)$")
                    if A.ieq(pr.state, "OPEN") and issue then
                        list[#list + 1] = { issue = tonumber(issue), pull = tonumber(pr.number) }
                    end
                end
            end
        end
    end
    return list
end

local fresh = fresh_items()

for _, agent in ipairs(A.agents()) do
    if writer(agent) and author_busy(running) then
        print("agent=" .. agent.id .. " waits, another job is running: " .. table.concat(running, ", "))
    elseif A.ieq(agent.role, "reviewer") and (reviewer_busy(agent, running) or writer_busy(running)) then
        print("agent=" .. agent.id .. " waits until the current writing, build or tests finish")
    else
        local woke = false
        for _, item in ipairs(fresh) do
            if woke then break end
            if trigger_from(agent, item.issue, item.pull) then woke = true end
        end
        if not woke then
            local hits = A.json_out({
                "gh", "search", "issues",
                "repo:" .. A.repo,
                "mentions:" .. agent.login,
                "is:open",
                "--limit", "10", "--json", "number",
            }, "gh search issues")
            if type(hits) ~= "table" or hits[1] == nil then
                print("agent=" .. agent.id .. " has no open mentions")
            else
                for _, hit in ipairs(hits) do
                    if woke then break end
                    local number = tonumber(hit.number)
                    local issueNumber, pullNumber = number, 0
                    local skip = false
                    local raw, code = A.capture({
                        "gh", "pr", "view", tostring(number), "--repo", A.repo,
                        "--json", "number,headRefName,state",
                    })
                    if code == 0 and A.trim(raw) ~= "" then
                        local pr = A.decode(raw, "gh pr view")
                        if not A.ieq(pr.state, "OPEN") then
                            skip = true
                        else
                            local issue = tostring(pr.headRefName or ""):match("^alpaca/(%d+)$")
                            if issue then
                                issueNumber = tonumber(issue)
                                pullNumber = tonumber(pr.number)
                            else
                                skip = true
                            end
                        end
                    end
                    if not skip and trigger_from(agent, issueNumber, pullNumber) then
                        woke = true
                    end
                end
                if not woke then print("agent=" .. agent.id .. " has no new mentions") end
            end
        end
    end
end

if #triggered > 0 then
    A.write(A.out .. "/triggers.txt", table.concat(triggered, "\r\n") .. "\r\n")
end
os.exit(0)
