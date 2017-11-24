local endereco = require("Endereco")
local json = require("json")

local Paciente = {nome, dataNasccimento, endereco, cartaoSus}

function Paciente:criar(nome, endereco, cartaoSus)
	self.nome = nome
	self.endereco = endereco
	self.cartaoSus = cartaoSus
	return self
end

function Paciente:json()
	return json.encode(self)
end

return Paciente