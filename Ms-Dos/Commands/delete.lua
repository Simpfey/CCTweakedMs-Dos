local args = { ... }

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$", "")
Fcwd.close()

fs.delete(cwd..args[1])
