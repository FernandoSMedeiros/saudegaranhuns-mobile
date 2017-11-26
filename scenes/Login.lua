local composer = require( "composer" )
local widget = require( "widget" )
local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )
local login = require( "controller.LoginRestController" )
local usuario = require( "model.Usuario" )

local loginRestController = login:criar()

local log = function()
  loginRestController:login()
end

local scene = composer.newScene()

function scene:create( event )
 
    local sceneGroup = self.view    
 
end

function scene:show( event )

    local sceneGroup = self.view    
    local phase = event.phase
 
    if ( phase == "will" ) then

      mui.init()

      mui.newTextField({
      parent = sceneGroup,
      labelText = "Cartão do SUS",
      name = "cart",      
      --text = "Número Cartão do SUS",
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = display.contentCenterY-50,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.getTextFieldProperty("cart", "label").x = display.getContentCenterX
    loginRestController.model.cartao = mui.getTextFieldProperty("cart", "text")


    mui.newRectButton({
        parent = sceneGroup,
        name = "login",
        text = "Login",
        width = 100,
        height = 30,
        x = display.getContentCenterX,
        y = display.contentCenterY,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,
        callBack = login,        
        })

    mui.newRectButton({
        parent = sceneGroup,
        name = "cadastrar",
        text = "Cadastrar",
        width = 100,
        height = 30,
        x = display.getContentCenterX,
        y = display.contentCenterY+50,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "scenes.CadastroPaciente",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        } 
        })

    mui.getRoundedRectButtonProperty("login", "text").x = display.getContentCenterX
    mui.getRoundedRectButtonProperty("cadastrar", "text").x = display.getContentCenterX

    elseif ( phase == "did" ) then
            
    

    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    
    sceneGroup:removeSelf()
    sceneGroup = nil
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