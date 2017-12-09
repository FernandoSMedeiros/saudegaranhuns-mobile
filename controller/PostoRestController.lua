local json = require("json")
local posto = require("model.Posto")

local PostoRestController = {view = nil, posto = {}}

function PostoRestController:criar()
	self.posto = posto:criar()
	self:todos()
	return self
end

function PostoRestController:todos()	
	network.request( "http://10.28.13.17/postos", "GET", networkListener)
end

function PostoRestController:buscar(id)	
	network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "GET", networkListener) 
end

function networkListener(event) 
    if ( event.isError ) then
        print(event.response)        
    else
        print ( "RESPONSE: " .. event.response )
    end
end