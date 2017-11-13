local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
sus = 0

function definirAnchorXeY (tabela)
  tabela.anchorX = 0
  tabela.anchorY = 0
end

function susListerner (event)
  if event.phase == "editing" then
    sus = event.text
  end
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local cor = {0.26, 0.55, 0.79}
        local alturaDaTela = display.contentHeight
        local larguraDaTela = display.contentWidth

        local retanguloMenu = display.newRect( 0, 0, larguraDaTela, 42 )
        definirAnchorXeY(retanguloMenu)
        retanguloMenu:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloMenu)

        local textoMenu = display.newText({
          text = "Login de paciente",
          width = 171,
          height = 18,
          x = 68,
          y = 13,
          fontSize = 14
        })
        definirAnchorXeY(textoMenu)
        sceneGroup:insert(textoMenu)

        local retanguloSUS = display.newRect(35, 100, 187, 25)
        definirAnchorXeY(retanguloSUS)
        retanguloSUS:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloSUS)

        local textoSUS = display.newText({
          text = "Número do cartão do SUS",
          width = 190,
          height = 19,
          x = 43,
          y = 103,
          fontSize = 14
        })
        definirAnchorXeY(textoSUS)
        sceneGroup:insert(textoSUS)

        inputSUS = native.newTextField(35, 130, 252, 25)
        definirAnchorXeY(inputSUS)
        sceneGroup:insert(inputSUS)

        local botaoLogin = widget.newButton({
            label = "Login",
            labelColor = {default = {0}, over={0}},
            fillColor = {default = {1}, over = {0.1,0.1,0.2}},
            strokeColor = {default = cor, over = cor},
            strokeWidth = 8,
            cornerRadius = 22,
            x = display.contentCenterX,
            y = 450,
            shape = "roundedRect",
        })
        sceneGroup:insert(botaoLogin)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    inputSUS:removeSelf()
 
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