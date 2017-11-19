local Endereco = {logradouro, numero, bairro, cep}

function Endereco.criar(logradouro, numero, bairro, cep)
	Endereco.logradouro = logradouro
	Endereco.numero =  numero
	Endereco.bairro = bairro 
	Endereco.cep = cep
	return Endereco
end

return Endereco