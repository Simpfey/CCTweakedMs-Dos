local args = { ... }

local Fcwd = fs.open("/Ms-Dos/Essentials/cwd.bin", "r")
local cwd = Fcwd.readAll():gsub("\n*$","")
local printer = peripheral.find("printer")
Fcwd.close()

if string.find(args[1], "/") then
    File = fs.open(cwd..args[1], "r")
else
    File = fs.open(cwd.."/"..args[1].."/", "r")
end

local lines = {}
pLine = 1

while true do
  local line = File.readLine()

  if not line then break end

  lines[#lines + 1] = line
end

File.close()

if not printer.newPage() then
  error("Cannot start a new page. Do you have ink and paper?")
end

for i=1,#lines do
  printer.setCursorPos(pLine, 3)
  printer.write(lines[i])

  pLine = pLine + 1
end

if not printer.endPage() then
  error("Cannot end the page. Is there enough space?")
end

print("Printing!")
