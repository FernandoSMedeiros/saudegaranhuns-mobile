local p = require("enumerador.Prioridade")
local s = require("enumerador.Status")
local e = require("enumerador.Especialidade")

local prioridade = p:criar()
local status = s:criar()
local especialidade = e:criar()

local Consulta = {especialidade, prioridade, status, dataSolicitação, dataAgendamento, paciente}

function Consulta.criar(especialidade, prioridade, status, dataSolicitação, dataAgendamento, paciente)
	
	Consulta.especialidade = especialidade[especialidade]
	Consulta.status = status[status]
	Consulta.prioridade = prioridade[prioridade]
	Consulta.dataSolicitação = datadataSolicitação
	Consulta.dataAgendamento = datadataAgendamento
	Consulta.paciente = paciente

	return Consulta
end

function Consulta.json()
	local json = json.encode(Consulta)
end

return Consulta