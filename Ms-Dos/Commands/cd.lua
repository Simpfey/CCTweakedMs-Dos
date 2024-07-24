local args = { ... }

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
Fcwd.close()

if args[1] == "../" then
    args[1] = "/../"
end

if string.find(args[1], "/") then
    shell.setDir(cwd..args[1])
else
    shell.setDir(cwd.."/"..args[1].."/")
end

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "w")
Fcwd.write(shell.dir())
Fcwd.close()
