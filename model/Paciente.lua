local endereco = require("model.Endereco")
local json = require("json")
local posto = require("model.Posto")

local Paciente = {nome, dataNascimento, endereco, cartaoSus, posto}

function Paciente:criar()
	self.nome = nil
	self.endereco = endereco:criar()
	self.cartaoSus = nil
	self.dataNascimento = nil
	self.posto = posto:criar()
	return self
end

function Paciente:json()
	return json.encode(self)
end

return Paciente