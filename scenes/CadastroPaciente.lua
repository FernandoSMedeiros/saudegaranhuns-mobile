local controller = require("controller.PacienteRestController")

local composer = require( "composer" )

local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" ) 
local scene = composer.newScene()
 
local salvar = function()
  
  pacienteController.paciente.nome = mui.getTextFieldProperty("nome", "value")
  pacienteController.paciente.endereco.logradouro = mui.getTextFieldProperty("logradouro", "value")
  pacienteController.paciente.endereco.bairro = mui.getTextFieldProperty("bairro", "value")
  pacienteController.paciente.cartaoSus = mui.getTextFieldProperty("cartao", "value")
  pacienteController.paciente.dataNascimento = mui.getTextFieldProperty("dataNasc", "value")

  pacienteController:salvar()

end
 
function scene:create( event )
 
    local sceneGroup = self.view    
    pacienteController = controller:criar()
 
end
 
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
     
    if ( phase == "will" ) then
        
        mui.init()

    display.newRect(sceneGroup, display.contentCenterX, 0, 320, 38 ).setFillColor = {1, 0, 1}
           
    mui.newTextField({
      parent = sceneGroup,
      labelText = "Nome",
      name = "nome",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 82,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Cartão do SUS",
      name = "cartao",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 136,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Data Nascimento",
      name = "dataNasc",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 200,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Logradouro",
      name = "logradouro",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 276,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Bairro",
      name = "bairro",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 332,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.getTextFieldProperty("nome", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("cartao", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("dataNasc", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("logradouro", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("bairro", "label").x = display.getContentCenterX
    
    mui.newRectButton({
        parent = sceneGroup,
        name = "voltar",
        text = "Voltar",
        width = 100,
        height = 30,
        x = display.contentCenterX-60,
        y = 436,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "scenes.Login",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        }             
    })

    mui.newRectButton({
        parent = sceneGroup,
        name = "cadastrar",
        text = "Cadastrar",
        width = 100,
        height = 30,
        x = display.contentCenterX+60,
        y = 436,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,
        callBack = salvar         
    })

    mui.getRoundedRectButtonProperty("cadastrar", "text").x = display.getContentCenterX
    mui.getRoundedRectButtonProperty("voltar", "text").x = display.getContentCenterX
 
    elseif ( phase == "did" ) then
             
    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    
    sceneGroup:removeSelf()
    mui.destroy()
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene