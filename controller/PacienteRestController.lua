local json = require("json")
local paciente = require("model.Paciente")

local PacienteRestController = {paciente = {}}

function PacienteRestController.criar()
	PacienteRestController.paciente = paciente:criar()
	return PacienteRestController
end

function PacienteRestController.salvar(event)
	if event.phase == "began" then
		local headers = {}
		local body = json.encode(PacienteRestController.paciente)
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "POST", networkListener, params)
	end	
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end

function PacienteRestController.atualizar(event)
	if event.phase == "began" then
		local headers = {}
		local body = json.encode(PacienteRestController.paciente)
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "PUT", networkListener, params)
	end	
end

return PacienteRestController