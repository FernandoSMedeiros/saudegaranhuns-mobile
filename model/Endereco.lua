local json = require("json")

local Endereco = {logradouro, numero, bairro, cep}

function Endereco:criar(logradouro, bairro)
	self.logradouro = logradouro
	self.bairro = bairro 	
	return self
end

function Endereco:json()
	return json.encode(self)	
end

return Endereco