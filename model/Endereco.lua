local json = require("json")

local Endereco = {logradouro, numero, bairro, cep}

function Endereco:criar(logradouro, numero, bairro)
	self.logradouro = logradouro
	self.numero =  numero
	self.bairro = bairro 	
	return self
end

function Endereco:json()
	return json.encode(self)	
end

return Endereco