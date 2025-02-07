local args = { ... }

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
Fcwd.close()

if string.find(args[1], "/") then
    File = fs.open(cwd..args[1], "r")
else
    File = fs.open(cwd.."/"..args[1].."/", "r")
end

local contents = File.readAll()
File.close()

print(contents)
