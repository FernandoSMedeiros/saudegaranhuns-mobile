local json = require("json")
local posto = require("model.Posto")

local PostoRestController = {view = nil, posto = {}}

function PostoRestController.criar()
	PostoRestController.posto = posto:criar()
	return PostoRestController
end

function PostoRestController.todos()	
	return json.decode(network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "GET", networkListener)) 
end

function PostoRestController.buscar(id)	
	return json.decode(network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "GET", networkListener)) 
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end