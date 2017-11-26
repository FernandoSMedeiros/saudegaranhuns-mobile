local json = require("json")
local consulta = require("model.Consulta")

local ConsultaRestController = {view = nil, consulta = {}}

function ConsultaRestController.criar()
	ConsultaRestController.consulta = consulta:criar()
	return ConsultaRestController
end

function ConsultaRestController.salvar(event)
	if event.phase == "began" then
		local headers = {}
		local body = ConsultaRestController.consulta.json()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "POST", networkListener, params)
	end	
end

function PacienteRestController.todos(event)	
	if event.phase == "began" then
		return json.decode(network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "GET", networkListener)) 
	end	
end

function ConsultaRestController.atualizar(event)
	if event.phase == "began" then
		local headers = {}
		local body = json.encode(ConsultaRestController.paciente)
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "PUT", networkListener, params)
	end	
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end
