local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local agent = A.agent(A.env("ALPACA_AGENT"))
local tester = tostring(agent.tester or "")
if tester == "" then os.exit(2) end

local failed = A.ieq(arg[1], "fail")
local pr = A.trim(A.read(A.out .. "/pr.txt") or "")
local target = pr:match("^%d+$") and "pr" or "issue"
local body = A.out .. "/comment.md"
local text = "<!-- alpaca -->\r\n\r\n@" .. tester .. " "
if failed then
    text = text .. "проверь, пожалуйста, упавшие тесты. "
        .. "Если править должен автор, позови его. Ревьюера зови, только когда функционально всё в порядке.\r\n"
else
    text = text .. "проверь, пожалуйста. Сборка и проверки этого цикла прошли. "
        .. "Если функционально всё в порядке, позови ревьюера. Если нет, позови автора и ревьюера не упоминай.\r\n"
end
A.write(body, text)
os.exit(A.run({ "lua", A.root .. "/comment-pr.lua", body, target }))
