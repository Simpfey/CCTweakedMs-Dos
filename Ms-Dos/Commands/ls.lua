local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
Fcwd.close()

local files = fs.list(cwd)

local organized = {}

for i=1,#files do
    if fs.isDir(cwd.."/"..files[i]) then
        organized[#organized+1] = files[i]
    end
end

for i=1,#files do
    if not fs.isDir(cwd.."/"..files[i]) then
        organized[#organized+1] = files[i]
    end
end

for i=1,#organized do
    if fs.isDir(cwd.."/"..organized[i]) then
        term.setTextColor(colors.green)
    end
    
    print(organized[i])
    
    term.setTextColor(colors.white)
end
