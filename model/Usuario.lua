local Usuario = {
	nome = nil,
	cartao = nil	
}

function Usuario:criar(nome, cartao)
	self.nome = nome
	self.cartao = cartao
	return self
end

return Usuario