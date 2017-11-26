local Usuario = {
	nome,
	cartao	
}

function Usuario:criar(nome, cartao)	
	self.nome = nome
	self.cartao = cartao
	return self
end

return Usuario