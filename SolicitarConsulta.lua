local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 consulta = {observacao = "", prioridade = "Nenhuma", especialidade = "Dentista"}

function definirAnchorXeY (tabela)
  tabela.anchorX = 0
  tabela.anchorY = 0
end

function observacaoListener (event)
  if event.phase == "editing" then
    consulta.observacao = event.text
    print(consulta.observacao)
  end
end

function semPrioridadeListener (event)
    consulta.prioridade = "Sem prioridade"
    print(consulta.prioridade)
end

function idosoListener (event)
    consulta.prioridade = "Idoso"
    print(consulta.prioridade)
end

function gestanteListener (event)
    consulta.prioridade = "Gestante"
    print(consulta.prioridade)
end

function bebeDeColoListener (event)
    consulta.prioridade = "Bebê de colo"
    print(consulta.prioridade)
end

function deficienteFisicoListener (event)
    consulta.prioridade = "Deficiente fisico"
    print(consulta.prioridade)
end

function dentistaListener (event)
    consulta.especialidade = "Dentista"
    print(consulta.especialidade)
end

function outrosListener (event)
    consulta.especialidade = "Outros"
    print(consulta.especialidade)
end

function semPrioridadeTextoListener (event)
    if event.phase == "began" then
        radioSemPrioridade:setState({isOn = true})
        consulta.prioridade = "Sem prioridade"
        print(consulta.prioridade)
    end
end

function idosoTextoListener (event)
    if event.phase == "began" then
        radioIdoso:setState({isOn = true})
        consulta.prioridade = "Idoso"
        print(consulta.prioridade)
    end
end

function gestanteTextoListener (event)
    if event.phase == "began" then
        radioGestante:setState({isOn = true})
        consulta.prioridade = "Gestante"
        print(consulta.prioridade)
    end
end

function deficienteFisicoTextoListener (event)
    if event.phase == "began" then
        radioDeficienteFisico:setState({isOn = true})
        consulta.prioridade = "Deficiente fisico"
        print(consulta.prioridade)
    end
end

function bebeDeColoTextoListener (event)
    if event.phase == "began" then
        radioBebeDeColo:setState({isOn = true})
        consulta.prioridade = "Bebê de colo"
        print(consulta.prioridade)
    end
end

function dentistaTextoListener (event)
    if event.phase == "began" then
        radioDentista:setState({isOn = true})
        consulta.especialidade = "Dentista"
        print(consulta.especialidade)
    end
end

function outrosTextoListener (event)
    if event.phase == "began" then
        radioOutros:setState({isOn = true})
        consulta.especialidade = "Outros"
        print(consulta.especialidade)
    end
end

function printar( )
    print("Consulta")
    print("Observação",consulta.observacao)
    print("Prioridade",consulta.prioridade)
    print("Especialidade",consulta.especialidade)
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

        --[[background = display.newRect(0,0,display.contentWidth,display.contentHeight)
        definirAnchorXeY(background)
        background:setFillColor(.5,.5,.5)
        sceneGroup:insert(background)]]

        retanguloMenu = display.newRect( 0, 0, larguraDaTela, 42 )
        definirAnchorXeY(retanguloMenu)
        retanguloMenu:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloMenu)

        textoMenu = display.newText({
          text = "Cadastro de consulta",
          width = 171,
          height = 18,
          x = 68,
          y = 13,
          fontSize = 14
        })
        definirAnchorXeY(textoMenu)
        sceneGroup:insert(textoMenu)

        retanguloObservacao = display.newRect(35, 98, 187, 27)
        definirAnchorXeY(retanguloObservacao)
        retanguloObservacao:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloObservacao)

        textoObservacao = display.newText({
          text = "Consulta",
          x = 45,
          y = 103,
          width = 99,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoObservacao)
        sceneGroup:insert(textoObservacao)

        inputObservacao = native.newTextBox(35,130,250,100)
        inputObservacao.isEditable = true
        inputObservacao.size=14
        inputObservacao.placeholder = "Descreva aqui o motivo da consulta"
        inputObservacao:addEventListener("userInput", observacaoListener)
        definirAnchorXeY(inputObservacao)
        sceneGroup:insert(inputObservacao)

        retanguloPrioridade = display.newRect(35, 240, 187, 27)
        definirAnchorXeY(retanguloPrioridade)
        retanguloPrioridade:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloPrioridade)

        textoPrioridade = display.newText({
          text = "Prioridade",
          x = 45,
          y = 245,
          width = 187,
          height = 27,
          fontSize = 14
        })
        definirAnchorXeY(textoPrioridade)
        sceneGroup:insert(textoPrioridade)

        prioridadeGroup = display.newGroup()
         
        radioSemPrioridade = widget.newSwitch({
            x = 35,
            y = 277,
            height = 19,
            width = 20,
            style = "radio",
            initialSwitchState = true,
            onPress = semPrioridadeListener
        })
        definirAnchorXeY(radioSemPrioridade)
        prioridadeGroup:insert(radioSemPrioridade)

        textoSemPrioridade = display.newText({
            text = "Sem prioridade",
            x = 55,
            y = 279,
            width = 95,
            height = 19,
            fontSize = 14
        })
        textoSemPrioridade:addEventListener("touch", semPrioridadeTextoListener)
        definirAnchorXeY(textoSemPrioridade)
        sceneGroup:insert(textoSemPrioridade)

        radioIdoso = widget.newSwitch({
            x = 155,
            y = 277,
            height = 19,
            width = 20,
            style = "radio",
            onPress = idosoListener
        })
        prioridadeGroup:insert(radioIdoso)
        definirAnchorXeY(radioIdoso)
         
        textoIdoso = display.newText({
            text = "Idoso",
            x = 175,
            y = 279,
            width = 35,
            height = 19,
            fontSize = 14
        })
        definirAnchorXeY(textoIdoso)
        textoIdoso:addEventListener("touch", idosoTextoListener)
        sceneGroup:insert(textoIdoso)

        radioGestante = widget.newSwitch({
            x = 215,
            y = 277,
            height = 19,
            width = 20,
            style = "radio",
            onPress = gestanteListener
        })
        prioridadeGroup:insert(radioGestante)
        definirAnchorXeY(radioGestante)
         
        textoGestante = display.newText({
            text = "Gestante",
            x = 235,
            y = 279,
            width = 100,
            height = 19,
            fontSize = 14
        })
        definirAnchorXeY(textoGestante)
        textoGestante:addEventListener("touch", gestanteTextoListener)
        sceneGroup:insert(textoGestante)

        radioDeficienteFisico = widget.newSwitch({
            x = 35,
            y = 300,
            height = 19,
            width = 20,
            style = "radio",
            onPress = deficienteFisicoListener
        })
        prioridadeGroup:insert(radioDeficienteFisico)
        definirAnchorXeY(radioDeficienteFisico)
         
        textoDeficienteFisico = display.newText({
            text = "Deficiente Fisico",
            x = 55,
            y = 302,
            width = 103,
            height = 19,
            fontSize = 14
        })
        definirAnchorXeY(textoDeficienteFisico)
        textoDeficienteFisico:addEventListener("touch", deficienteFisicoTextoListener)
        sceneGroup:insert(textoDeficienteFisico)

        radioBebeDeColo = widget.newSwitch({
            x = 163,
            y = 300,
            height = 19,
            width = 20,
            style = "radio",
            onPress = bebeDeColoListener
        })
        prioridadeGroup:insert(radioBebeDeColo)
        definirAnchorXeY(radioBebeDeColo)
         
        textoBebeDeColo = display.newText({
            text = "Bebê de colo",
            x = 183,
            y = 302,
            width = 103,
            height = 19,
            fontSize = 14
        })
        definirAnchorXeY(textoBebeDeColo)
        textoBebeDeColo:addEventListener("touch", bebeDeColoTextoListener)
        sceneGroup:insert(textoBebeDeColo)
         
        sceneGroup:insert(prioridadeGroup)

        retanguloEspecialidade = display.newRect(35, 325, 187, 27)
        definirAnchorXeY(retanguloEspecialidade)
        retanguloEspecialidade:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloEspecialidade)

        textoEspecialidade = display.newText({
          text = "Especialidade",
          x = 45,
          y = 330,
          width = 99,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoEspecialidade)
        sceneGroup:insert(textoEspecialidade)

        especialidadeGroup = display.newGroup()
         
        radioDentista = widget.newSwitch({
            x = 35,
            y = 357,
            height = 19,
            width = 20,
            style = "radio",
            initialSwitchState = true,
            onPress = dentistaListener
        })
        definirAnchorXeY(radioDentista)
        especialidadeGroup:insert(radioDentista)

        textoDentista = display.newText({
            text = "Dentista",
            x = 55,
            y = 359,
            width = 52,
            height = 19,
            fontSize = 14
        })
        textoDentista:addEventListener("touch", dentistaTextoListener)
        definirAnchorXeY(textoDentista)
        sceneGroup:insert(textoDentista)

        radioOutros = widget.newSwitch({
            x = 113,
            y = 357,
            height = 19,
            width = 20,
            style = "radio",
            onPress = outrosListener
        })
        especialidadeGroup:insert(radioOutros)
        definirAnchorXeY(radioOutros)
         
        textoOutros = display.newText({
            text = "Outros",
            x = 133,
            y = 359,
            width = 45,
            height = 19,
            fontSize = 14
        })
        definirAnchorXeY(textoOutros)
        textoOutros:addEventListener("touch", outrosTextoListener)
        sceneGroup:insert(textoOutros)

        sceneGroup:insert(especialidadeGroup)

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
            onPress = printar
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
    inputObservacao:removeSelf()
 
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