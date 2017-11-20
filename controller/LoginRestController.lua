local json = require("json")
local mod = require("Usuario")

LoginRestController = {
	model = mod
}

function LoginRestController:criar()
	LoginRestController[1] = 

	return cartao
end

function LoginRestController.login(event)
	if event.phase == "began" then
		return json.decode(network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/" .. LoginRestController.model.cartao, "GET", networkListener)) 
	end	
end

return LoginRestController