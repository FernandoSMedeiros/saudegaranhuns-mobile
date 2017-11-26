local json = require("json")
local mod = require("model.Usuario")

local LoginRestController = {
	model = mod 
}

function LoginRestController:criar()
	self.model = mod:criar(0) 

	return LoginRestController
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end

function LoginRestController:login(cartaoSus)	
	json.decode(network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/" .. self.model.cartao, "GET", networkListener))
end

return LoginRestController