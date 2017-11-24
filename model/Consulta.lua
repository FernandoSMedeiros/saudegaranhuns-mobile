local p = require("enumerador.Prioridade")
local s = require("enumerador.Status")
local e = require("enumerador.Especialidade")

local prioridade = p:criar()
local status = s:criar()
local especialidade = e:criar()

local Consulta = {especialidade, prioridade, status, dataSolicitação, dataAgendamento, paciente}

function Consulta:criar(especialidade, prioridade, status, dataSolicitação, dataAgendamento, paciente)
	
	self.especialidade = especialidade[especialidade]
	self.status = status[status]
	self.prioridade = prioridade[prioridade]
	self.dataSolicitação = datadataSolicitação
	self.dataAgendamento = datadataAgendamento
	self.paciente = paciente

	return Consulta
end

function Consulta:json()
	local json = json.encode(self)
end

return Consulta