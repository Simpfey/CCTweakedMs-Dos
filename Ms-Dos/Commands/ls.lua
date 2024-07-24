local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
Fcwd.close()

local files = fs.list(cwd)
for i=1,#files do
    if fs.isDir(cwd.."/"..files[i]) then
        term.setTextColor(colors.green)
    end
    
    print(files[i])
    
    term.setTextColor(colors.white)
end
