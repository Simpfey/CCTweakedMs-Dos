local args = { ... }

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
Fcwd.close()

if string.find(args[1], "/") then
    if string.find(args[2], "/") then
        fs.move(cwd..args[1], cwd..args[2])
    else
        fs.move(cwd..args[1], cwd.."/"..args[2].."/")
    end
else
    if string.find(args[2], "/") then
        fs.move(cwd.."/"..args[1].."/", cwd..args[2])
    else
        fs.move(cwd.."/"..args[1].."/", cwd.."/"..args[2].."/")
    end
end
