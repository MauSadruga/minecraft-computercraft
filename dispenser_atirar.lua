print("Segure CTRL + S para sair.")
print()
print("Atirar por quantos segundos?")
tempo = tonumber(read()) * 20
i = 0

while (i < tempo) do
 
 redstone.setOutput("bottom", not redstone.getOutput("bottom"))
 sleep(0.05)
 
 i = i + 1 

end

os.shutdown()
