print("Bloco no slot 1")
print("Escada no slot 2")
print("")
print("Digite a altura da escada: ")

local altura = tonumber(read())
local alturaAtual = 0

while (alturaAtual < altura) do

 turtle.digUp()
 turtle.select(1)
 turtle.place()
 turtle.up()
 turtle.select(2)
 turtle.placeDown()

end
