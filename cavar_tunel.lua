versao = "1.0.2"
tempoEspera = 1

function cavarFrente()
	turtle.dig()
	sleep(tempoEspera)
	while (turtle.detect()) do
		turtle.dig()
		sleep(tempoEspera)
	end
end

function meiaVolta()
	local i = 0
	while (i < 2) do
		turtle.turnRight()
		i = i+1
	end
end

function irCima()
	turtle.digUp()
	sleep(tempoEspera)
	while (turtle.detectUp()) do
		turtle.digUp()
		sleep(tempoEspera)
	end
	turtle.up()
end

function irBaixo()
	turtle.digDown()
	turtle.down()
end

function colocarTocha()
	turtle.select(15)
	turtle.place()
	turtle.select(1)
end

function colocarBau()	
	if (turtle.getItemCount(13) >= 1) then
		turtle.select(14)
		meiaVolta()
		turtle.placeDown()
		meiaVolta()		
		local slotSelecionado = 1
		while (slotSelecionado < 14) do	
			turtle.select(slotSelecionado)
			turtle.dropDown(turtle.getItemCount(slotSelecionado))			
			slotSelecionado = slotSelecionado + 1
		end
		
		turtle.select(1)
	end	
end

function cavarTunel(profundidadeAtual)

	-- Início
	cavarFrente()
	turtle.forward()
	
	-- Indo para cima
	turtle.turnLeft()
	turtle.dig()
	meiaVolta()
	turtle.dig()
	irCima()
	
	colocarBau()
	
	turtle.dig()
	meiaVolta()
	turtle.dig()
	irCima()
	
	turtle.dig()
	
	if (profundidadeAtual % 8 == 0) then
		colocarTocha()
	end
	
	meiaVolta()
	turtle.dig()
	turtle.turnLeft()
	cavarFrente()
	turtle.forward()
	
	-- Indo para baixo
	turtle.turnLeft()
	turtle.dig()
	meiaVolta()
	turtle.dig()
	irBaixo()
	
	turtle.dig()
	meiaVolta()
	turtle.dig()
	irBaixo()
	
	turtle.dig()
	meiaVolta()
	turtle.dig()
	turtle.turnLeft()

end

function limparTerminal()
	term.clear()
    term.setCursorPos(1,1)
	print("cavar-tunel v" ..versao)
	print()
end

-- Início do programa

limparTerminal()

print("Digite a profundidade do túnel: ")

local profundidade = tonumber(read())
local profundidadeAtual = 0
local combustivelNecessario = (profundidade * 3) + 3

limparTerminal()

print("Combustível necessário para minerar: " ..combustivelNecessario)
print("Combustível atual: " ..turtle.getFuelLevel())

while (turtle.getFuelLevel() < combustivelNecessario) do

	turtle.select(16)
	turtle.refuel()
	turtle.select(1)
 
 if (turtle.getFuelLevel() >= combustivelNecessario) then break end

 print()
	print("Preciso de combustível. Coloque no 16º slot.")
	sleep(tempoEspera*5)

end

while (profundidadeAtual < profundidade) do

	limparTerminal()
	cavarTunel(profundidadeAtual)
	profundidadeAtual = profundidadeAtual + 2
	
	print("Profundidade atual: " ..profundidadeAtual)
	print("Faltam " ..profundidade-profundidadeAtual.. " fileiras.")
	
end

turtle.up()

while (profundidadeAtual > 0) do
	turtle.back()
	profundidadeAtual = profundidadeAtual - 1
end