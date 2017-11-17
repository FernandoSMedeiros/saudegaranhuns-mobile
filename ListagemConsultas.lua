local composer = require( "composer" )
local widget = require( "widget" )
 
local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )

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

    mui.init()
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        -- local cor = {0.26, 0.55, 0.79}
        -- local alturaDaTela = display.contentHeight
        -- local larguraDaTela = display.contentWidth
        -- local quantConsultas = 5

        -- retanguloMenu = display.newRect( 0, 0, larguraDaTela, 42 )
        -- definirAnchorXeY(retanguloMenu)
        -- retanguloMenu:setFillColor(unpack(cor))
        -- sceneGroup:insert(retanguloMenu)

        -- textoMenu = display.newText({
        --   text = "Listagem de consultas",
        --   width = 171,
        --   height = 18,
        --   x = 68,
        --   y = 13,
        --   fontSize = 14
        -- })
        -- definirAnchorXeY(textoMenu)
        -- sceneGroup:insert(textoMenu)

        -- local function onRowRender( event )
 
        --     local row = event.row
         
        --     local rowTitle = display.newText( row, "Consulta " .. row.index, 0, 0, nil, 14 )
        --     definirAnchorXeY(rowTitle)
        --     rowTitle:setFillColor( 0 )
         
        --     rowTitle.x = 20
        --     rowTitle.y = 23
        -- end

        -- local function onRowTouch( event )
        --     for i,v in pairs(event.row) do
        --         print(i,v)
        --     end
        -- end
         
        -- local tableView = widget.newTableView(    {
        --     x = 0,
        --     y = 75,
        --     height = display.contentHeight-75,
        --     width = display.contentWidth,
        --     onRowRender = onRowRender,
        --     onRowTouch = onRowTouch,
        --     listener = scrollListener
        -- })
        -- definirAnchorXeY(tableView)
         
        -- for i = 1, quantConsultas do
        --     tableView:insertRow{}
        -- end

        -- sceneGroup:insert(tableView)
 
    elseif ( phase == "did" ) then
       
       mui.newTableView({
    parent = mui.getParent(),
    name = "tableview_demo",
    width = 180,
    height = 100,
    top = 10,
    left = muiData.safeAreaWidth - 190,
    font = native.systemFont,
    fontSize = 8,
    textColor = { 0, 0, 0, 1 },
    lineColor = { 1, 1, 1, 1 },
    lineHeight = 2,
    rowColor = {1, 1, 1, 1}, --{ default={1,1,1}, over={1,0.5,0,0.2} },
    rowHeight = 20,
    -- rowAnimation = false, -- turn on rowAnimation
    noLines = false,
    callBackTouch = mui.onRowTouchDemo,
    callBackRender = mui.onRowRenderDemo,
    scrollListener = mui.scrollListener,  -- needed if using buttons, etc within the row!
    list = { -- if 'key' use it for 'id' in the table row
        { key = "Row1", text = "Row 1", value = "1", isCategory = true, valign = "middle" },
        { key = "Row2", text = "Row 2", value = "2", isCategory = false, valign = "middle" },
        { key = "Row3", text = "Row 3", value = "3", isCategory = false, valign = "middle" },
        { key = "Row4", text = "Row 4", value = "4", isCategory = false },
        { key = "Row5", text = "Row 5", value = "5", fontSize = 8, isCategory = false, columns = {
                { text = "Row 5C1", value = "5A", align = "left", valign = "top" },
                { text = "Row 5C2", value = "5B", align = "left", valign = "middle" },
                { text = "Row 5C3", value = "5C", align = "left", valign = "bottom" },
            },
        },
        { key = "Row6", text = "Row 6", value = "6", fontSize = 8, isCategory = false, columns = {
                { text = "Row 6 Col 1", value = "6A", align = "center" },
                { text = "Row 6 Col 2", value = "6B", align = "center" },
                { text = "Row 6 Col 3", value = "6C", align = "center" },
            },
        },
        { key = "Row7", text = "Row 7", value = "7", fontSize = 8, isCategory = false, columns = {
                { text = "Row 7 Col 1", value = "7A", align = "right" },
                { text = "Row 7 Col 2", value = "7B", align = "right" },
                { text = "Row 7 Col 3", value = "7C", align = "right" },
            },
        },
        { key = "Row8", text = "Row 8", value = "8", isCategory = false, fillColor = { 0, 0, 1, 0.2 }, valign = "top" },
        -- below are rows with different colors
        -- set "noLines" to true above to omit line border
        -- { key = "Row5", text = "Row 5", value = "5", isCategory = false, fillColor = { 0.67, 0.98, 0.65, 0.2 } },
        -- { key = "Row6", text = "Row 6", value = "6", isCategory = false, fillColor = { 1, 0, 0, 0.2 }  },
    },
    columnOptions = {
        widths = { 60, 60, 60 }, -- must supply each else "auto" is assumed.
    },
    categoryColor = { default={0.8,0.8,0.8,0.8} },
    categoryLineColor = { 1, 1, 1, 0 },
    touchpointColor = { 0.4, 0.4, 0.4 },
})
 
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