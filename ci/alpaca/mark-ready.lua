local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")
local T = dofile(A.lib .. "/targets.lua")(A)

local agent = A.agent(A.env("ALPACA_AGENT"))
local reviewer = tostring(agent.reviewer or "")
if reviewer == "" then os.exit(2) end
if not A.ieq(A.env("ALPACA_REASON"), "comments") then os.exit(2) end
local pr = A.trim(A.read(A.out .. "/pr.txt") or "")
if not pr:match("^%d+$") then os.exit(2) end

local view = A.json_out({
    "gh", "pr", "view", pr, "--repo", A.repo, "--json", "isDraft,reviews",
}, "gh pr view")
if view.isDraft ~= true then os.exit(2) end

local latest = nil
if type(view.reviews) == "table" then
    for _, review in ipairs(view.reviews) do
        if type(review) == "table" and type(review.author) == "table" and A.ieq(review.author.login, reviewer) then
            if not latest or tostring(review.submittedAt or "") > tostring(latest.submittedAt or "") then
                latest = review
            end
        end
    end
end
if not latest or not A.ieq(latest.state, "APPROVED") then os.exit(2) end

local approvedAt = A.timekey(latest.submittedAt)
local stamps = T.stamps(tonumber(A.issue()), tonumber(pr))
for _, stamp in ipairs(stamps) do
    if stamp.kind ~= "start"
        and not A.ieq(stamp.login, agent.login)
        and A.reacts(agent, stamp.login)
        and A.timekey(stamp.at) > approvedAt then
        print("newer comment after approval, draft stays")
        os.exit(2)
    end
end

local code = A.run({ "gh", "pr", "ready", pr, "--repo", A.repo })
if code ~= 0 then os.exit(code) end
local body = A.out .. "/comment.md"
A.write(body, "<!-- alpaca -->\r\n\r\n" .. reviewer .. " одобрил изменения. Снимаю черновик, PR готов.\r\n")
os.exit(A.run({ "gh", "pr", "comment", pr, "--repo", A.repo, "--body-file", body }))
