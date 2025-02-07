local args = { ... }

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
Fcwd.close()

if string.find(args[1], "/") then
    fs.makeDir(cwd..args[1])
else
    fs.makeDir(cwd.."/"..args[1].."/")
end

