local dir = (arg[0] or ""):gsub("\\", "/"):match("^(.*)/[^/]+$") or "."
local A = dofile(dir .. "/lib/alpaca.lua")

os.remove(A.out .. "/comment.md")
os.remove(A.out .. "/verdict.txt")
os.remove(A.out .. "/test-job.txt")
os.exit(0)
