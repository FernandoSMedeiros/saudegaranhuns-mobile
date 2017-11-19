local composer = require( "composer" )
 

local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" ) 
local scene = composer.newScene()
 
local paciente = {nome, sus, nascimento, endereco = {logradouro, bairro, numero}}
 
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
    
    mui.init()
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        
    display.newRect(sceneGroup, display.contentCenterX, 0, 320, 38 ).setFillColor = {1, 0, 1}
           
    mui.newTextField({
      parent = sceneGroup,
      labelText = "Nome",
      name = "nome",      
      --text = nil,
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
      --text = nil,
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
      --text = nil,
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
      labelText = "Endereço",
      name = "endereco",      
      --text = nil,
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
      --text = nil,
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

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Numero",
      name = "numero",      
      --text = nil,
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 394,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.getTextFieldProperty("nome", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("cartao", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("dataNasc", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("endereco", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("bairro", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("numero", "label").x = display.getContentCenterX

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
        iconText = "picture_in_picture",
        iconFont = mui.materialFont,
        iconFontColor = { 1, 1, 1, 1 },
        touchpoint = true,
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "Login",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = true
        } -- scene CadastroPaciente.lua
            
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
        iconText = "picture_in_picture",
        iconFont = mui.materialFont,
        iconFontColor = { 1, 1, 1, 1 },
        touchpoint = true,
        --callBack = login,        
        })

    mui.getRoundedRectButtonProperty("cadastrar", "text").x = display.getContentCenterX
    mui.getRoundedRectButtonProperty("voltar", "text").x = display.getContentCenterX
 
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