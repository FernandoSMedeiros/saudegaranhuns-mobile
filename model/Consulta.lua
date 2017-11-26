local json = require("json")

local p = require("model.enumerador.Prioridade")
local s = require("model.enumerador.Status")
local e = require("model.enumerador.Especialidade")

local prioridade = p:criar()
local status = s:criar()
local especialidade = e:criar()

local Consulta = { especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente }

function Consulta:criar (especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente)
	
	self.especialidade = especialidade[especialidade]
	self.status = status[status]
	self.prioridade = prioridade[prioridade]
	self.dataSolicitacao = datadataSolicitacao
	self.dataAgendamento = datadataAgendamento
	self.paciente = paciente

	return self
end

function Consulta:json()
	return json.encode(self)
end

return Consulta