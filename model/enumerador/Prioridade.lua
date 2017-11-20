local Prioridade = {
	GESTANTE = 1, 
	IDOSO = 2, 
	BEBE_DE_COLO = 3, 
	DEFICIENTE_FISICO = 4, 
	NORMAL = 5
}

function Prioridade:criar()
	return self
end

return Prioridade