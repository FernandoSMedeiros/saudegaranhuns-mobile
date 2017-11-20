local p = require("enumerador.Prioridade")
local s = require("enumerador.Status")
local e = require("enumerador.Especialidade")

local prioridade = p:criar()
local status = s:criar()
local especialidade = e:criar()

local Consulta = {
	prioridade = nil
	status = nil
	data = nil
	especialidade = nil
}

function Consulta.criar(especialidade, prioridade, status, data)
	
	Consulta.especialidade = especialidade[especialidade]
	Consulta.status = status[status]
	Consulta.prioridade = prioridade[prioridade]
	Consulta.data = data

	return Consulta
end

return Consulta