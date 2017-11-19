local Status = {
	PENDENTE = 1, 
	MARCADO = 2, 
	CONSULTADO = 3, 
	CANCELADO = 4
}

function Status:criar()
	return self
end

return Status