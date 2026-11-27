local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local lookup = false
for i = 1, #arg do
    if arg[i] == "--lookup" then lookup = true end
end

local issue = A.issue()
local branch = A.branch()
A.mkdirs(A.out)

local function open_pr()
    local list = A.json_out({
        "gh", "pr", "list", "--repo", A.repo, "--head", branch,
        "--state", "open", "--json", "number",
    }, "gh pr list")
    if type(list) ~= "table" or list[1] == nil then return nil end
    return tostring(list[1].number)
end

local function request_reviewer(pull, login)
    if not login or login == "" then return end
    local text, code = A.capture({
        "gh", "api",
        "repos/" .. A.repo .. "/pulls/" .. pull .. "/requested_reviewers",
    })
    if code ~= 0 then
        print("could not read reviewers for PR " .. pull)
        return
    end
    local ok, view = pcall(A.json.decode, text)
    local users = ok and type(view) == "table" and view.users or nil
    if type(users) == "table" then
        for _, user in ipairs(users) do
            if type(user) == "table" and user.login and A.ieq(user.login, login) then
                print("reviewer " .. login .. " already requested")
                return
            end
        end
    end
    local payload = A.out .. "/reviewer.json"
    A.write(payload, A.json.encode({ reviewers = { login } }))
    code = A.run({
        "gh", "api", "--method", "POST",
        "repos/" .. A.repo .. "/pulls/" .. pull .. "/requested_reviewers",
        "--input", payload,
    })
    if code ~= 0 then
        print("could not request reviewer " .. login)
        return
    end
    print("requested reviewer " .. login)
end

if not lookup then
    local code = A.run({ "git", "push", "origin", "HEAD:" .. branch })
    if code ~= 0 then os.exit(code) end
end

local pr = open_pr()
if not pr and not lookup then
    local title, code = A.capture({
        "gh", "issue", "view", issue, "--repo", A.repo, "--json", "title", "--jq", ".title",
    })
    if code ~= 0 then A.die("gh issue view failed with " .. tostring(code)) end
    title = A.trim((title or ""):gsub("[\r\n]+", " "))
    if title == "" then title = "alpaca #" .. issue end
    local payload = A.out .. "/pr-create.json"
    A.write(payload, A.json.encode({
        title = title,
        head = branch,
        base = "main",
        body = "Alpaca-Issue: " .. issue .. "\n\nRefs #" .. issue .. "\n",
        draft = true,
    }))
    code = A.run({
        "gh", "api", "--method", "POST", "repos/" .. A.repo .. "/pulls", "--input", payload,
    })
    if code ~= 0 then os.exit(code) end
    pr = open_pr()
end

if pr then
    A.write(A.out .. "/pr.txt", pr)
    if not lookup then
        local agent = A.agent(A.env("ALPACA_AGENT"))
        request_reviewer(pr, tostring(agent.reviewer or ""))
    end
    print("PR " .. pr)
    os.exit(0)
end
if lookup then
    A.write(A.out .. "/pr.txt", "pending")
    print("PR pending")
    os.exit(0)
end
A.die("Pull request for " .. branch .. " was not created")
