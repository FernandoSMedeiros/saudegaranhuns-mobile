local Endereco = {logradouro, numero, bairro, cep}

function Endereco.criar(logradouro, numero, bairro)
	Endereco.logradouro = logradouro
	Endereco.numero =  numero
	Endereco.bairro = bairro 	
	return Endereco
end

function Endereco.json()
	local json = json.encode(Paciente)
end

return Endereco