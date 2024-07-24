local completion = require "cc.completion"
local Tables = require "Ms-Dos/Api/Tables"
local Strings = require "Ms-Dos/Api/Strings"
local Fver = fs.open("/Ms-Dos/Essentials/Version.bin", "r")
local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "w")

Fcwd.write("/")
Fcwd.close()

local History = {}
local ver = Fver.readLine()

Fver.close()

term.clear()
term.setCursorPos(1,1)

write("Ms-Dos ver "..ver..".\n")

while true do
    local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
    local cwd = Fcwd.readAll():gsub("\n*$","")
    Fcwd.close()
    local files = Tables.Concat(fs.list("/Ms-Dos/Commands/"), fs.list(cwd))
    
    for i=1,#files do
        files[i] = files[i]:gsub(".lua", "")
    end
    
    term.setTextColor(colors.white)
    write(cwd.."> ")
    term.setTextColor(colors.green)
    local msg = read(nil, History, function(text) return completion.choice(text, files) end, nil)
    term.setTextColor(colors.white)
    
    History[#History+1] = msg
    
    local cmd = Strings.Split(msg, " ")
    
    if not string.find(cmd[1], ".") then
        cmd[1] = cmd[1]..".lua"
    end
       
    if fs.exists("/Ms-Dos/Commands/"..cmd[1]) then
        cmd[1] = "/Ms-Dos/Commands/"..cmd[1]
        shell.run(Tables.Unpack(cmd))
    else
        if fs.exists(cwd..cmd[1]) then
            cmd[1] = cwd..cmd[1]
            shell.run(Tables.Unpack(cmd))
        else
            term.setTextColor(colors.red)
            write("File does not exist!\n")
            term.setTextColor(colors.white)
        end
    end
end
