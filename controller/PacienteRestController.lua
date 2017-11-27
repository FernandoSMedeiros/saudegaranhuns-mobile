local json = require("json")
local paciente = require("model.Paciente")

local PacienteRestController = {
	paciente = nil
}

function PacienteRestController:criar()
	self.paciente = paciente:criar()
	return self
end

function PacienteRestController:salvar()
	
		local headers = {}
		local body = self.paciente:json()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		print("SALVAR JSON: " .. body)

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "POST", networkListener, params)
	
end

function PacienteRestController:atualizar()
	
		local headers = {}
		local body = self.paciente:json()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		print(body)

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "PUT", networkListener, params)
	
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end

return PacienteRestController