term.clear()
term.setCursorPos(1,1)
print("Cavando Basalto abaixo...")

local i = 0

while (i < 60)  do

 turtle.digDown() 
 sleep(0.5)
 i = i + 1
 
end

print("Programa finalizado.")
sleep(2)

os.shutdown()
