local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

A.run({ "git", "checkout", "-f", "--", "." })
A.run({ "git", "clean", "-fd", "-e", "/ci/alpaca/out", "-e", "ci/alpaca/out" })
os.exit(0)
