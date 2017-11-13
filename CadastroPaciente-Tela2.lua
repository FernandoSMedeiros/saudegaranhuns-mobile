local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
paciente = {nome, sus, nascimento, endereco = {logradouro, bairro, numero}}

function definirAnchorXeY (tabela)
  tabela.anchorX = 0
  tabela.anchorY = 0
end

 function logradouroListener(event)
  if event.phase == "editing"  then
    paciente.endereco.logradouro = event.text
  end
end

function numeroListener(event)
  if event.phase == "editing"  then
    paciente.endereco.numero = event.text
  end
end

function bairroListener(event)
  if event.phase == "editing"  then
    paciente.endereco.bairro = event.text
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
          text = "Cadastro de paciente",
          width = 171,
          height = 18,
          x = 68,
          y = 13,
          fontSize = 14
        })
        definirAnchorXeY(textoMenu)
        sceneGroup:insert(textoMenu)

        local retanguloEndereco = display.newRect(35, 100, 187, 25)
        definirAnchorXeY(retanguloEndereco)
        retanguloEndereco:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloEndereco)

        local textoEndereco = display.newText({
          text = "Endereço",
          width = 78,
          height = 19,
          x = 43,
          y = 103,
          fontSize = 14
        })
        definirAnchorXeY(textoEndereco)
        sceneGroup:insert(textoEndereco)

        inputLogradouro = native.newTextField(35, 130, 252, 25)
        definirAnchorXeY(inputLogradouro)
        inputLogradouro.placeholder = "Logradouro"
        sceneGroup:insert(inputLogradouro)

        inputNumero = native.newTextField(35, 161, 252, 25)
        definirAnchorXeY(inputNumero)
        inputNumero.placeholder = "Número"
        sceneGroup:insert(inputNumero)

        inputBairro = native.newTextField(35, 192, 252, 25)
        definirAnchorXeY(inputBairro)
        inputBairro.placeholder = "Bairro"
        sceneGroup:insert(inputBairro)

        local botaoCadastrar = widget.newButton({
            label = "Cadastrar",
            labelColor = {default = {0}, over={0}},
            fillColor = {default = {1}, over = {0.1,0.1,0.2}},
            strokeColor = {default = cor, over = cor},
            strokeWidth = 8,
            cornerRadius = 22,
            x = display.contentCenterX,
            y = 450,
            shape = "roundedRect",
        })
        sceneGroup:insert(botaoCadastrar)
 
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
    inputBairro:removeSelf()
    inputNumero:removeSelf()
    inputLogradouro:removeSelf()
 
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