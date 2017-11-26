local json = require("json")

local Posto = {nome, endereco}

function Posto:criar(nome, endereco)
	self.nome = nome
	self.endereco = endereco
	return self
end

function Posto:json()
	return json.encode(self)
end

return Posto