local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

local feelings = A.feelings_snapshot()
A.run({ "git", "checkout", "-f", "--", "." })
A.run({ "git", "clean", "-fd", "-e", "/ci/alpaca/out", "-e", "ci/alpaca/out" })
A.feelings_restore(feelings)
os.exit(0)
