local json = require "json"
local mod = require("model.Usuario")
local composer = require("composer")

local LoginRestController = {
	model = mod 
}

function LoginRestController:criar()
	self.model = mod:criar("", 0) 

	return LoginRestController
end

function networkListener(event) 
    
    if ( event.isError ) then
        print( "Network error: ", event.response )
    end
        
    local response = event.response
    local tabela = json.decode( response )

    if tabela ~= nil and tabela.cartao ~= nil then
        composer.gotoScene("scenes.MenuPrincipal")
    else
        print("Errou") 
    end 
    
end

function LoginRestController:login()
    composer.gotoScene("scenes.MenuPrincipal")
	network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/" .. self.model.cartao , "GET", networkListener)    
end



return LoginRestController