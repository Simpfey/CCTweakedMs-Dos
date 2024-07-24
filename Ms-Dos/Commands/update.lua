local Gcommits = http.get("https://raw.githubusercontent.com/Simpfey/CCTweakedMs-Dos/main/.commit")
local GversionFile = http.get("https://raw.githubusercontent.com/Simpfey/CCTweakedMs-Dos/main/Ms-Dos/Essentials/Version.bin")
local Fversion = fs.open("/Ms-Dos/Essentials/Version.bin", "r")
local Gversion = GversionFile.readAll():gsub("\n*$", "")
local version = Fversion.readAll():gsub("\n*$", "")
local lines = {}
Fversion.close()

if Gversion == version then
    write("Ms-Dos already up to date!\n")
    return
else
    local AlrVersion = false
    local StrtAdd = false
    while true do
        local line = Gcommits.readLine()
        
        if not line then break end
       
        if line == "-- "..version then
            AlrVersion = true
        end
        
        if AlrVersion then
            if string.sub(line,1,string.len("-- ")) == "-- " then
                StrtAdd = true
            end
        end
        
        if StrtAdd then
            if not string.sub(line,1,string.len("-- ")) == "-- " then
                lines[#lines+1] = line
            end
        end
    end    
end

for i=1,#lines do
    if lines[i] == "" then
        return
    end
    
    write("Updating "..lines[i].."...")
    local Gfile = http.get("https://raw.githubusercontent.com/Simpfey/CCTweakedMs-Dos/main"..lines[i])
    
    local file = fs.open(lines[i], "w")
    file.write(Gfile.readAll())
    file.close()
    term.clearLine()
    write("Updating "..lines[i].."... Done!")
end
