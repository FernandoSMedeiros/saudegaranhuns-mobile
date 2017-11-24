local endereco = require("Endereco")
local json = require("json")

local Paciente = {nome, dataNasccimento, endereco, cartaoSus}

function Paciente.criar(nome, endereco, cartaoSus)
	Paciente.nome = nome
	Paciente.endereco = endereco
	Paciente.cartaoSus = cartaoSus
	return Paciente
end

function Paciente.json()
	local json = json.encode(Paciente)
end

return Paciente