local composer = require( "composer" )
local widget = require( "widget" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
function definirAnchorXeY (tabela)
  tabela.anchorX = 0
  tabela.anchorY = 0
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
        local quantConsultas = 5

        retanguloMenu = display.newRect( 0, 0, larguraDaTela, 42 )
        definirAnchorXeY(retanguloMenu)
        retanguloMenu:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloMenu)

        textoMenu = display.newText({
          text = "Listagem de consultas",
          width = 171,
          height = 18,
          x = 68,
          y = 13,
          fontSize = 14
        })
        definirAnchorXeY(textoMenu)
        sceneGroup:insert(textoMenu)

        local function onRowRender( event )
 
            local row = event.row
         
            local rowTitle = display.newText( row, "Consulta " .. row.index, 0, 0, nil, 14 )
            definirAnchorXeY(rowTitle)
            rowTitle:setFillColor( 0 )
         
            rowTitle.x = 20
            rowTitle.y = 23
        end

        local function onRowTouch( event )
            for i,v in pairs(event.row) do
                print(i,v)
            end
        end
         
        local tableView = widget.newTableView(    {
            x = 0,
            y = 75,
            height = display.contentHeight-75,
            width = display.contentWidth,
            onRowRender = onRowRender,
            onRowTouch = onRowTouch,
            listener = scrollListener
        })
        definirAnchorXeY(tableView)
         
        for i = 1, quantConsultas do
            tableView:insertRow{}
        end

        sceneGroup:insert(tableView)
 
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