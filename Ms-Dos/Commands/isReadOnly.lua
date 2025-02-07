local args = { ... }

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
Fcwd.close()

if string.find(args[1], "/") then
    local a = fs.isReadOnly(cwd..args[1])
else
    local a = fs.isReadOnly(cwd.."/"..args[1].."/")
end

write(a .. "\n")
