local endereco = require("Endereco")

local Paciente = {nome = "", endereco = {}, cartaoSus = 0}

function Paciente.criar(nome, endereco, cartaoSus)
	Paciente.nome = nome
	Paciente.endereco = endereco
	Paciente.cartaoSus = cartaoSus
	return Paciente
end

return Paciente