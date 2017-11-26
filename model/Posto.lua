local json = require("json")

local Posto = {nome, endereco}

function Posto:criar()
	self.nome = nil
	self.endereco = nil
	return self
end

function Posto:json()
	return json.encode(self)
end

return Posto